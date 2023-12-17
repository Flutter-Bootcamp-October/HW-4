import 'dart:io';

import 'package:shelf/shelf.dart';

Future<Response> createPostAdminHandler(Request request) async {
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
    if (authHeader != "Bearer $token") {
      print(token);
      print(authHeader);
      return Response.forbidden('Invalid token');
    }


    return Response.ok('Post created successfully');
  } catch (e) {
    return Response.internalServerError(body: 'Server error: $e');
  }
}
