import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';

loginAuthHandler(Request req) async {
  final File file = File("user.txt");
  List userfile = await file.readAsLines();
  final body = jsonDecode(await req.readAsString());
  if (body["email"] == userfile[0] && body["password"] == userfile[1]) {
    final random = Random();
    final token = random.nextInt(10000000);
    final File file = File("token.txt");
    file.writeAsString("$token");
    return Response.ok(token);
  }
  return Response.badRequest(body: "not matched");
}
