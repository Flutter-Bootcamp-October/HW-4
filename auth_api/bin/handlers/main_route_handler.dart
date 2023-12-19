import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';

import 'methods/check_login.dart';
import 'methods/create_token.dart';

loginRouteHandler(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    await checkLogin(email: body["email"], password: body["password"]);
    await createToken();

    return Response.ok("login success");
  } on FormatException catch (e) {
    return Response.badRequest(body: e.message);
  } catch (error) {
    return Response.badRequest(body: error.toString());
  }
}

printInfoHandler(Request req) async {
  //print id, name in response
  try {
    final body = json.decode(await req.readAsString());
    final id = req.headers["id"];
    String name = body["name"];

    return Response.ok("id:$id, name:$name");
  } catch (error) {
    return Response.badRequest(body: error.toString());
  }
}

responseLoginRouteHandler(Request req) async {
  // print in response email, pass
  try {
    final body = json.decode(await req.readAsString());
    String email = body["email"];
    String password = body["password"];

    return Response.ok("login success, email:$email, password:$password");
  } catch (error) {
    return Response.badRequest(body: error.toString());
  }
}

homeRouteHandler(Request req) {
  // print home path
  return Response.ok(req.requestedUri.toString());
}
