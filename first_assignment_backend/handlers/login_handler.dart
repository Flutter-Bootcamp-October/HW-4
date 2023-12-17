import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';

loginHandler(Request req) async {
  //---------------------------
  final body = json.decode(await req.readAsString());

  //---------------------------
  File file = File('user.txt');

  //---------------------------
  // print(body);
  //---------------------------
  // print(file.readAsLinesSync()[0]);
  // print(body["email"]);
  //---------------------------
  // print(file.readAsLinesSync()[1]);
  // print(body["password"]);

  //---------------------------
  try {
    if (body["email"] == file.readAsLinesSync()[0] &&
        body["password"] == file.readAsLinesSync()[1]) {
      //---------- generate random token -----------------

      final token = getRandString();
      // print(token);
      //Map response = {"mess": "you have succssefuly login ", "token": token};

      File tokenFile = File('token.txt');
      tokenFile.writeAsString(token);

      return Response.ok('you have succssefuly login your token : $token');
    }
  } catch (e) {
    print(e.toString());
  }
  return Response.ok("Your email or password is wrong");
}

// method to genrate the token
String getRandString() {
  var random = Random.secure();
  var values = List<int>.generate(1000, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
