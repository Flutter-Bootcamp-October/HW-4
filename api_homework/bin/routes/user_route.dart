import 'package:shelf_router/shelf_router.dart';

import '../handler/user_root_handler.dart';

class UserRoute {
  Router get route {
    final appRoute = Router();
    appRoute
      ..post('/login', login)
      ..post('/token', token);

    return appRoute;
  }
}
