import 'package:shelf_router/shelf_router.dart';
import '../handlers/root/get_root_handler.dart';
import '../handlers/root/home_root_handler.dart';
import 'auth_route.dart';
import 'user_route.dart';

class MainRoute {
  Router get routeApp {
    final route = Router();
    route
          ..get('/', rootRoot)
          ..mount('/user', UserRoute().route)..mount('/auth', AuthRoute().route)
          ..get('/mohammed', rootMoh)
        // ..all("/<ignored|.*>", wrongError)
        ;

    return route;
  }
}
