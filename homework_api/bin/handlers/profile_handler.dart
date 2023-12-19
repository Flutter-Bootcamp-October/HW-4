import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'dart:io';

profileHandler(Request req) async {
  final body = jsonDecode(await req.readAsString());
  final temp = body["email"].split("@");
  return Response.ok(jsonEncode({"name": temp[0], "id": 1}));
}
