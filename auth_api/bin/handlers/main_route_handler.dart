import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

loginRouteHandler(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final email = body["email"];
    final password = body["password"];

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



String randomToken() {
  return DateTime.now().toString();
}
