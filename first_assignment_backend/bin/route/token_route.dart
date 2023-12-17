import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../handlers/token_handler.dart';

class TokenRoutes {
  Handler get route {
    final appRoute = Router();

    appRoute.post("/token", tokenHandler);

    final pipline = Pipeline().addMiddleware(checkToken()).addHandler(appRoute);

    return pipline;
  }
}

Middleware checkToken() => (innerHandler) => (Request req) {
      print("here is Middleware");
      File tokenFile = File('token.txt');
      print(tokenFile.readAsLinesSync());

      final headers = req.headers;
      if (headers["token"] == tokenFile.readAsLinesSync()[0]) {
        return innerHandler(req);
      }
      return Response.unauthorized("Sorry your token is wrong");
    };
