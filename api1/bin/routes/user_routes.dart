import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/users/user_login.dart';
import '../handlers/users/user_check_iogin.dart';

class userRoutes {
  Handler get routes {
    final appRoute = Router();
    appRoute
      ..get('/', (Request req) {
        return Response.ok('body');
      })
      ..post('/login', loginUserHandeler)
      ..post('/token', checkLogInHandler);
    final pipeline =
        Pipeline().addMiddleware(checkAuth()).addHandler((appRoute));
    return pipeline;
  }
}

Middleware checkAuth() => (innerHandler) => (Request req) async {
      final hed = req.headers;
      final body = jsonDecode(await req.readAsString());
      final tokenPath = File("./token.txt");
      final logInPath = File("./file.txt");
      final email = body["email"];
      final password = body["password"];
      if (hed["token"] == await tokenPath.readAsString()) {
        return innerHandler(req);
      } else if (email + password == await logInPath.readAsString()) {
        return innerHandler(req);
      }
      return Response.unauthorized('invalid');
    };
String Token() {
  var random = Random.secure();
  var values = List.generate(32, (i) => random.nextInt(256));
  return base64Url.encode(values);
}
