import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';

login(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());
    final emailUser = body["email"];
    final passwordUser = body["password"];

    final path = './auth.txt';
    final File file = File(path);
    final fileData = await file.readAsLines();
    if (emailUser == fileData[0] && passwordUser == fileData[1]) {
      Random random = Random();
      final token = random.nextInt(1000000);

      final path = './token.txt';
      final File file = File(path);
      await file.writeAsString("$token");
      return Response.ok("here is you token : $token");
    }
    return Response.badRequest(body: "incorrect email and password");
  } catch (e) {
    return Response.badRequest(body: e.toString());
  }
}

token(Request req) async {
  try {
    final File file = File('./token.txt');
    final fileData = await file.readAsLines();
    if (req.headers["token"] == fileData[0]) {
      return Response.ok("Success");
    }
    return Response.badRequest(body: "incorrect token");
  } catch (e) {
    return Response.badRequest(body: e.toString());
  }
}
