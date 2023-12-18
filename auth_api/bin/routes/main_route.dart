import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/main_route_handler.dart';

class MainRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..post("/login", loginRouteHandler)
      ..post("/info", printInfoHandler)
      ..post("/resLogin", responseLoginRouteHandler)
      ..get("/home", homeRouteHandler);

    final pipeline =
        Pipeline().addMiddleware(createPost()).addHandler(appRoute);

    return appRoute;
  }
}

Middleware createPost() => ((innerHandler) => (Request req) async {
      final header = req.headers;
      if (header["token"] == readToken()) {
        return innerHandler(req);
      } else {
        return Response.unauthorized("token not valid 11");
      }
    });

readToken() async {
  final tokenPath = "token.txt";
  final File tokenFile = File(tokenPath);
  final token = await tokenFile.readAsString();
  return token;
}
