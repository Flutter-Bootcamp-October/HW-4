import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

homeHandler(Request req) async {
  File file = File('bin/database/database.txt');
  List<String> lines = file.readAsLinesSync();
  final body = jsonDecode(await req.readAsString());
  for (var l in lines) {
    List temp = l.split(",");
    if (temp[0] == body["email"] &&
        temp[1] == body["password"] &&
        temp[2] == body["token"]) {
      return Response.ok("In home successfully");
    }
  }
  return Response.badRequest(
      body: "Unsuccessful attempt. Token might be invalid");
}
