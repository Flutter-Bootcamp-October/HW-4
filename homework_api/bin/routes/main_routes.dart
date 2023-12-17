import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'user_routes.dart';

class MainRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..mount("/user", UserRoutes().route)
      ..all("/<ignored|.*>", (Request req) {
        return Response.ok("sorry page not found");
      });
    return appRoute;
  }
}
