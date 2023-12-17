import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/post_handler.dart';

class PostRoutes {
  Handler get route {
    final appRoute = Router();
    appRoute.get("/", postHandler);

    final pipeline = Pipeline()
        .addMiddleware((innerHandler) => (Request req) async {
              final reqToken = req.headers["token"];
              final File file = File("token.txt");
              final dataBasetoken = await file.readAsString();
              if (reqToken == dataBasetoken) {
                return innerHandler(req);
              }
              return Response.badRequest(body: "Unautherized");
            })
        .addHandler(appRoute);
    return pipeline;
  }
}
