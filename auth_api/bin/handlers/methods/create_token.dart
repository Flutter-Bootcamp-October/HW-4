import '../main_route_handler.dart';
import 'dart:io';

import 'main_route_handler.dart';

createToken() async {
  final tokenPath = 'token.txt';
  final File tokenFile = File(tokenPath);
  final token = randomToken();
  await tokenFile.writeAsString(token);
  return token;
}
