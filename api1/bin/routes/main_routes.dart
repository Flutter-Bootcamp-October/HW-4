import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'user_routes.dart';

class MainRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..mount('/users', userRoutes().routes)
      ..all("/<ignorid|.*>", (Request req) {
        return Response.ok('sorry not found');
      });

  
    return appRoute;
  }
}

