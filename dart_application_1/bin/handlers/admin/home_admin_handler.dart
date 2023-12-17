import 'package:shelf/shelf.dart';

homeAdminHandler(Request req) {
  return Response.ok(req.requestedUri.toString());
}
