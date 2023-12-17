import 'package:shelf_router/shelf_router.dart';

import '../handlers/auth/user_login_handler.dart';

class AuthRoute {
  Router get route {
    final appRoute = Router();
    appRoute.get("/login", userLoginHandler);

    return appRoute;
  }
}
