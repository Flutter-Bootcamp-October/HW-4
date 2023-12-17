import 'dart:io';

import 'package:shelf/shelf_io.dart';

import 'routes/main_route.dart';

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;
  final port = Platform.environment["PORT"] ?? '8080';

  final server = await serve(MainRoute().route, ip, int.parse(port));

  print("https://${server.address.host}:${server.port}");
}
