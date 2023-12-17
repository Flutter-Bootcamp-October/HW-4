import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/massge_handler.dart';

class MassgeRoute {
  Handler get route {
    final appRoute = Router();
    appRoute.get("/", massgeHandler);

    final pipeline = Pipeline()
        .addMiddleware((innerHandler) => (Request req) async {
              final tokenRequest = req.headers['Authorization'];
              if (await _verifyToken(tokenRequest)) {
                return innerHandler(req);
              }
              return Response.forbidden('Sorry, you do not have access. You are unauthorized.');
            })
        .addHandler(appRoute);
    return pipeline;
  }

  Future<bool> _verifyToken(String? token) async {
    try {
      final storedTokens = await File("token.txt").readAsString();
      final tokenList = storedTokens.split('\n');
      return tokenList.contains(token);
    } catch (_) {
      return false;
    }
  }
}

