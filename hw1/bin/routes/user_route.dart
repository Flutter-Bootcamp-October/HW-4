import 'package:shelf_router/shelf_router.dart';

import '../handlers/user/create_post_handler.dart';
import '../handlers/user/login_handler.dart';

class UserRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..post("/login", loginHandler)
      ..post("/create_post", createPostHandler);

    return appRoute;
  }
}
