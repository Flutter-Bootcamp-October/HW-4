import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/rootHandler.dart';
import 'admin_route.dart';
import 'user_route.dart';

class MainRoutes {
  Handler get route {
    final router = Router();

    // Public routes
    router.get("/", rootHandler);
    router.mount(
        '/admin', AdminRoutes().publicRoute); // No token validation here

    // Apply token validation middleware to other routes
    final protectedRouter = Router();
    protectedRouter.mount('/user', UserRoutes().route); // Protected user routes
    protectedRouter.mount(
        '/admin', AdminRoutes().protectedRoute); // Protected admin routes

    final protectedRoutes = Pipeline()
        .addMiddleware(tokenValidatorMiddleware())
        .addHandler(protectedRouter);

    // Combine public and protected routes
    router.mount("/", protectedRoutes);

    // Catch-all for undefined routes
    router.all("/<ignored|.*>", (Request req) {
      return Response.notFound("Page not found");
    });

    return router;
  }
}
