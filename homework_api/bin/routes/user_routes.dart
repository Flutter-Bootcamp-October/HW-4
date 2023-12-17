import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/home_handler.dart';
import '../handlers/login_handler.dart';

class UserRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..post("/home", homeHandler)
      ..post("/login", loginHandler)
      ..all("/<ignored|.*>", (Request req) {
        return Response.ok("sorry page not found");
      });
    return appRoute;
  }
}
