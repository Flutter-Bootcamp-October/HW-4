import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/rootHandler.dart';
import 'admin_route.dart';
import 'user_route.dart';

class MainRoutes {
  Handler get route {
    final router = Router();

    router.get("/", rootHandler);
    router.mount(
        '/admin', AdminRoutes().publicRoute);

    final protectedRouter = Router();
    protectedRouter.mount('/user', UserRoutes().route);
    protectedRouter.mount(
        '/admin', AdminRoutes().protectedRoute); 

    final protectedRoutes = Pipeline()
        .addMiddleware(tokenValidatorMiddleware())
        .addHandler(protectedRouter);

    router.mount("/", protectedRoutes);

    router.all("/<ignored|.*>", (Request req) {
      return Response.notFound("Page not found");
    });

    return router;
  }
}
