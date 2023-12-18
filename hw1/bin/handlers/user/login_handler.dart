import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../user.txt.dart';

loginHandler(Request req) async {
  try {
    final body = jsonDecode(await req.readAsString());

    final email = body["email"];
    final password = body["password"];

    if (email == userEmail && password == userPassword) {
      return Response.ok("Successfully login");
    } else
      return Response.badRequest(body: "Invalid login");
  } catch (error) {
    return Response.badRequest(body: "there is error");
  }
}
