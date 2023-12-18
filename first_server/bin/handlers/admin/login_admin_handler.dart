import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:shelf/shelf.dart';

Future<Response> loginAdminHandler(Request request) async {
  try {
    final requestBody = await request.readAsString();
    final credentials = json.decode(requestBody);
    final file = File('user.txt');
    if (!await file.exists()) {
      return Response.internalServerError(body: 'User file not found');
    }
    final userContent = await file.readAsString();
    final userCredentials = json.decode(userContent);

    if (credentials['email'] == userCredentials['email'] &&
        credentials['password'] == userCredentials['password']) {
      final random = Random();
      final token = random.nextInt(100000).toString();

      await File('token.txt').writeAsString(token);

      return Response.ok(json.encode({'token': token}));
    }

    return Response.forbidden('pass or email is wrong');
  } catch (e) {
    return Response.internalServerError(body: 'Server error: $e');
  }
}
