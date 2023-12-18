import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/rootHandler.dart';
import 'Admin_routes.dart';
import 'user_Routes.dart';

class MainRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..get("/", rootHandler)
      ..mount('/user', UserRoutes().route)
      ..mount('/admin', AdminRoutes().routes);
    final protectedRouter = Router();
    protectedRouter.mount('/user', UserRoutes().route);
    protectedRouter.mount('/admin', AdminRoutes().protectedRoute);

    final protectedRoutes = Pipeline()
        .addMiddleware(tokenValidatorMiddleware())
        .addHandler(protectedRouter);

    appRoute.mount("/", protectedRoutes);

    appRoute.all("/<ignored|.*>", (Request req) {
      return Response.notFound("Page not found");
    });
    return appRoute;
  }
}
