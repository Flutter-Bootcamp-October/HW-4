import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/auth/login_user_handler.dart';

class AuthRoute {
  Handler get route {
    final routeApp = Router();
    routeApp.post('/login', userLogin);

    final pipline = Pipeline()
        .addMiddleware((innerHandler) => (Request req) async {
              final body = jsonDecode(await req.readAsString());
              final file = File('./data.txt');
              final check = jsonDecode(await file.readAsString());
              if (check["email"] == body["email"] &&
                  check["password"] == body["password"]) {
                return innerHandler(req);
              }

              return Response.badRequest(body: "you and me");
            })
        .addHandler(routeApp);
    return pipline;
  }
}
