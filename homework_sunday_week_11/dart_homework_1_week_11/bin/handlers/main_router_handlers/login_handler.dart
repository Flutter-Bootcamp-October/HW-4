import 'dart:io';

import 'package:shelf/shelf.dart';

login(Request req) async {
  final tokenFile = await File('bin/assets/token.txt');
  tokenFile.writeAsStringSync('to102kjh7jfd');
  return Response.ok('logged in successfully and your token is (to102kjh7jfd)');
}
