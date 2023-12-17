import 'dart:io';

import 'package:shelf/shelf.dart';

checkLogInHandler(Request req) {
  return Response.ok('Token is correct');
}
