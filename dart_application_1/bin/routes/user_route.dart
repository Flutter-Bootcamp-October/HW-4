import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserRoutes {
  Router get route {
    final appRoute = Router();

    appRoute
      ..get("/home", (Request req) {
        return Response.ok("user");
      })
      ..get("/login", (Request req) {
        return Response.ok("user");
      })
      ..get("/signup", (Request req) {
        return Response.ok("user");
      });

    return appRoute;
  }
}
