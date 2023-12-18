import 'package:shelf_router/shelf_router.dart';
import '../handlers/rootHandler.dart';
import 'user_route.dart';

class MainRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..get("/", rootHandler)
      ..mount("/user", UserRoutes().route);

    return appRoute;
  }
}
