import 'dart:convert';

import 'package:shelf/shelf.dart';

homeAdminHandler(Request req) async {
  final body = jsonDecode(await req.readAsString());

  final x = body['number1'];
  final y = body['number2'];

  return Response.ok("result = ${x + y}");
}
