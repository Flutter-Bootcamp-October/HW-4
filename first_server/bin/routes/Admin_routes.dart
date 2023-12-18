import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/admin/create_page.dart';
import '../handlers/admin/home_admin_handler.dart';
import '../handlers/admin/login_admin_handler.dart';
import '../handlers/admin/sginup_admin_handler.dart';

class AdminRoutes {
  Router get routes {
    final appRoute = Router();
    appRoute
      ..get('/home', homeAdminHandler)
      ..post('/login', loginAdminHandler)
      ..get('/signup', signupAdminHandler)
      ..post("/create-post", createPostAdminHandler);

    return appRoute;
  }

  Handler get protectedRoute {
    final router = Router();
    router.get("/home", homeAdminHandler);
    return router;
  }
}

Middleware tokenValidatorMiddleware() {
  return (Handler innerHandler) {
    return (Request request) async {
      try {
        final authHeader = request.headers['authorization'];
        if (authHeader == null) {
          return Response.forbidden('no token provided');
        }

        final tokenFile = File('token.txt');
        if (!await tokenFile.exists()) {
          return Response.internalServerError(body: 'Token file not found');
        }

        final token = await tokenFile.readAsString();
        if (authHeader != token) {
          return Response.forbidden('Invalid token');
        }

        return innerHandler(request);
      } catch (e) {
        return Response.internalServerError(body: 'Server error: $e');
      }
    };
  };
}
