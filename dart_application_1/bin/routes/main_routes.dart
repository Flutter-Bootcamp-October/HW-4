import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/main_handler.dart';
import 'login_route.dart';
import 'post_route.dart';

class MainRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..get("/", mainRoute)
      ..mount("/login", LoginRoutes().route)
      ..mount('/post', PostRoutes().route)
      ..all("/<ignored|.*>", (Request req) {
        Response.ok("notfound");
      });
    return appRoute;
  }
}
