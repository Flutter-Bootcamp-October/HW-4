import 'dart:io';

import 'package:shelf/shelf.dart';

loginRouteHandler(Request req) async {
  try {
    final userPath = './user.txt';
    final File userFile = File(userPath);
    userFile.openRead();

    final tokenPath = './token.txt';
    final File tokenFile = File(tokenPath);
    final token = randomToken();
    await tokenFile.writeAsString(token);
    return Response.ok("login success");
  } catch (e) {
    return Response.badRequest(body: "login faild");
  }
}

postRouteHandler(Request req) async {
  final tokenPath = './token.txt';
  final File tokenFile = File(tokenPath);
  final String token = await tokenFile.readAsString();
  if (req.headers["token"] == token) {
    return Response.ok("valid token");
  }
  return Response.unauthorized("token not valid");
}

String randomToken() {
  return DateTime.now().toString();
}
