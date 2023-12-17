
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/main_handler.dart';
import 'massge_route.dart';
import 'signin_route.dart';


class MainRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..get("/", rootHandler)
      ..mount("/signin", SigninRoute().route)
      ..mount('/massges', MassgeRoute().route)
      ..all("/<ignored|.*>", (Request req) {
        Response.ok("sorry we can't found it");
      });
    return appRoute;
  }
}
