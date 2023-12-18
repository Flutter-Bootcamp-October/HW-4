import 'dart:io';

import 'package:shelf/shelf_io.dart';

import 'routes/main_routes.dart';

void main() async {
  //configration for API
  // 1 ip
  final ip = InternetAddress.anyIPv4;
  // 2 port
  final port = int.parse(Platform.environment["PORT"] ?? "8080");
  // 3 server=<endpount+ip+port>
  final server = await serve(MainRoute().route, ip, port);
  //====================================================
  print("http://${server.address.host}:${server.port}");
}
