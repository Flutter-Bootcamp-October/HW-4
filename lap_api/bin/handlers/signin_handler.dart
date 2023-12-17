import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';




Future<Response> SigninHandler(Request req) async {
  final File userFile = File("user.txt");
  final List<String> users = await userFile.readAsLines();
  final body = jsonDecode(await req.readAsString());

  for (var user in users) {
    final userCredentials = user.split(',');
    if (body['email'] == userCredentials[0] && body['password'] == userCredentials[1]) {
      final random = Random();
      final token = "fofuuj${random.nextInt(3333)}allq";

      final File tokenFile = File("token.txt");
      var existingTokens = await tokenFile.readAsLines();
      existingTokens.add(token);

      await tokenFile.writeAsString(existingTokens.join('\n'));
      return Response.ok(token);
    }
  }

  return Response.badRequest(body: "something wrong..check your password or your name");
}



