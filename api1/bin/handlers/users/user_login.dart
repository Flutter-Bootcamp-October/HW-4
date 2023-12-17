import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../../routes/user_routes.dart';

late String randomToken;
loginUserHandeler(Request req) async {
  try {
    randomToken = Token();
    final path1 = './token.txt';
    var tokenFile = File(path1);
    tokenFile.writeAsStringSync(randomToken);
    return Response.ok(randomToken);
  } catch (error) {
    return Response.badRequest(body: "invalid login");
  }
}
