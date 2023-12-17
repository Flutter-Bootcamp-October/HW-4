import 'package:shelf_router/shelf_router.dart';

import '../handlers/signin_handler.dart';

class SigninRoute {
  Router get route {
    final appRoute = Router();
    appRoute.post("/", SigninHandler);

    return appRoute;
  }
}
