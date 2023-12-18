import 'dart:io';

import 'package:shelf/shelf.dart';

mainRouteHandler(Request req) {
  return Response.ok("body");
}

loginRouteHandler(Request req) async {
  try {
    final userPath = './user.txt';
    final File userFile = File(userPath);
    userFile.openRead().toList();

    final tokenPath = './token.txt';
    final File tokenFile = File(tokenPath);

    final String token = randomToken();
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
