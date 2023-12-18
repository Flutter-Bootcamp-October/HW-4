import 'dart:io';

import 'package:shelf/shelf.dart';

createPostHandler(Request req) async {
  try {
    final pathToken = './token.txt';
    final File file = File(pathToken);
    final tokenData = await file.readAsLines();

    if (req.headers["token"] == tokenData[0]) {
      return Response.ok("${tokenData[0]} is Success");
    } else {
      return Response.badRequest(body: 'incorrect token');
    }
  } catch (error) {
    return Response.badRequest(body: 'Sorry there was an error $error');
  }
}
