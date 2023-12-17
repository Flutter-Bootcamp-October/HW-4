import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/user/token_user_handler.dart';

class UserRoute {
  Handler get route {
    final routeApp = Router();
    routeApp.post('/token', userSign);

    final pipline = Pipeline()
        .addMiddleware((innerHandler) => (Request req) async {
              final token = File('./token.txt');
              final checkToken = await token.readAsString();
              print(checkToken);
              final header = req.headers;
              if (header["token"] == checkToken) {
                return innerHandler(req);
              }

              return Response.badRequest(body: "you and me");
            })
        .addHandler(routeApp);
    return pipline;
  }
}
