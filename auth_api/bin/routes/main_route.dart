import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/main_route_handler.dart';

class MainRoutes {
  Handler get route {
    final appRoute = Router();
    appRoute
      ..get("/", mainRouteHandler)
      ..get("/login", loginRouteHandler)
      ..post("/post", postRouteHandler);

    final pipeline =
        Pipeline().addMiddleware(createPost()).addHandler(appRoute);

    return pipeline;
  }
}

Middleware createPost() => ((innerHandler) => (Request req) async {
      final tokenPath = './token.txt';
      final File tokenFile = File(tokenPath);
      final String token = await tokenFile.readAsString();
      if (req.headers["token"] == token) {
        return innerHandler(req);
      }
      return Response.unauthorized("token not valid");
    });
