import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'handlers/rootHandler.dart';
import 'routes/login_routes.dart';

class MainRoutes {
  Handler get route {
    final appRoute = Router();
    appRoute
      ..get('/', rootHandler)
      ..mount('/user', UserRoutes().route)
      ..all('/<ignored|.*>', (Request req) {
        return Response.ok('Sorry not found you page');
      });
    final handler = Pipeline()
        .addMiddleware(
          (innerHandler) => (Request req) {
            if (req.headers["type"] == "user") {
              return innerHandler(req);
            } else {
              return Response.unauthorized("sorry unauthorized");
            }
          },
        )
        .addHandler(appRoute);
    return handler;
  }
}
