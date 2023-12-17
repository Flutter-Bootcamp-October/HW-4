import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/post/user_post_handler.dart';

class PostRoute {
  Handler get route {
    final appRoute = Router();
    appRoute.get("/post", userPostHandler);

    final pipe = Pipeline()
        .addMiddleware((innerHandler) => (Request req) async {
              // try {
              final path = './token';
              final File file = File(path);
              final token = await file.readAsLines();

              if (req.headers["token_id"]! == token[0]) {
                return Response.ok("post successfully");
              } else {
                return Response.unauthorized("token is not correct");
              }
              // } catch (err) {
              //   return Response.badRequest(body: "error");
              // }
            })
        .addHandler(appRoute);

    return pipe;
  }
}
