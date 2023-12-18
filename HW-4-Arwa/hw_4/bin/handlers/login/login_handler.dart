import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';

loginHandler(Request req) async {
  try {
    final pathUser = './user.txt';
    final File file = File(pathUser);
    final loginData = await file.readAsLines();

    final body = jsonDecode(await req.readAsString());
    print('here is before if');
    if (body["email"] == loginData[0] && body["pass"] == loginData[1]) {
      Random randomNum = Random();
      final token = randomNum.nextInt(1000000);
      final pathToken = './token.txt';
      final File file = File(pathToken);
      await file.writeAsString('$token');
      print('here if');
      return Response.ok('Successfully & Token is $token');
    } else {
      print('here else');
      return Response.badRequest(body: "The email or password is incorrect");
    }
  } catch (error) {
    return Response.badRequest(body: "sssssSorry there was an error $error");
  }
//email & password
}
