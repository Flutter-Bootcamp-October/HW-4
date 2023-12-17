import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'auth_route.dart';
import 'post_route.dart';

class MainRoute {
  Handler get route {
    final appRoute = Router();
    appRoute
      ..get("/", (Request req) {
        return Response.badRequest(body: "no route");
      })
      ..mount('/auth', AuthRoute().route)
      ..mount('/users', PostRoute().route)
      ..all("/ignored|*", (Request req) => Response.badRequest(body: req));

    return appRoute;
  }
}
