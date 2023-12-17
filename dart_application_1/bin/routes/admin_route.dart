import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/admin/create_Post_Handler.dart';
import '../handlers/admin/home_admin_handler.dart';
import '../handlers/admin/login_admin_handler.dart';
import '../handlers/admin/signup_admin_handler.dart';

class AdminRoutes {
  Handler get publicRoute {
    final router = Router();
    router.get("/home", homeAdminHandler);
    router.post("/login", loginAdminHandler);
    router.post("/signup", signUpAdminHandler);
    router.post("/create-post", createPostAdminHandler);

    return router;
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
          return Response.forbidden('No authorization header');
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
