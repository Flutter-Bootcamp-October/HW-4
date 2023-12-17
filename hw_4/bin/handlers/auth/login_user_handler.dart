import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:shelf/shelf.dart';

userLogin(Request req) async {
  try {
    final token = Uuid().v4();

    final file = File('./token.txt');
    file.writeAsString(token.toString());
    return Response.ok(token.toString());
  } catch (e) {
    return Response.ok("enter numaric");
  }
}
