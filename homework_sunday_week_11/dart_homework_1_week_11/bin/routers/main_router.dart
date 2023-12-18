import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/main_router_handlers/create_post_handler.dart';
import '../handlers/main_router_handlers/login_handler.dart';
import '../handlers/middleware_handler/middleware_handler.dart';

class MainRoute {
  Handler get route {
    final mainRoute = Router();
    mainRoute
      ..post('/login', login)
      ..post('/create-post', createPost)
      ..all('/<ignore|.*>', (Request req) {
        return Response.ok('Route not found! 404');
      });

    final pipline = Pipeline().addMiddleware(checkAuth()).addHandler(mainRoute);
    return pipline;
  }
}
