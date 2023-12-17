import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';

loginHandler(Request req) async {
  final File user = File("user.txt");
  List userTxt = await user.readAsLines();
  final body = jsonDecode(await req.readAsString());
  if (body['name'] == userTxt[0] && body['password'] == userTxt[1]) {
    final random = Random();
    final token = "ihthw${random.nextInt(1000000000)}afaw";
    final File file = File("token.txt");
    file.writeAsString(token);
    return Response.ok(token);
  }
  return Response.badRequest(body: "name or password don't match");
}
