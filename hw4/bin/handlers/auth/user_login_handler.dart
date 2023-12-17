import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';

userLoginHandler(Request req) async {
  try {
    final response = jsonDecode(await req.readAsString());
    final email = response['email'].toString();
    final password = response['password'].toString();
    final path = './credentials';
    final File file = File(path);
    final content = await file.readAsLines();

    if (content[0].split(":")[1].contains(email) &&
        content[1].split(":")[1].contains(password)) {
      final File file = File("./token");
      final tokenID = Random().nextInt(1000000);
      file.writeAsString(tokenID.toString(), mode: FileMode.write);
      return Response.ok("logged in token is $tokenID");
    } else {
      return Response.ok("wrong credentials");
    }
  } catch (err) {
    return Response.badRequest(body: "User Not Found");
  }
}
