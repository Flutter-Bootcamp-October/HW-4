import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'user_route.dart';

class MainRoute {
  Handler get route {
    final appRoute = Router();
    appRoute
      ..get('/', (Request req) {
        return Response.ok("body");
      })
      ..mount("/user", UserRoute().route)
      ..all('/<ignore|.*>', (Request req) {
        return Response.ok("sorry");
      });

    final handler = Pipeline()
        .addMiddleware(
          (innerHandler) => (Request req) {
            final headers = req.headers;
            if (headers["type"] == "user") {
              return innerHandler(req);
            }
            return Response.unauthorized("sorry unauthorized");
          },
        )
        .addHandler(appRoute);

    return handler;
  }
}
