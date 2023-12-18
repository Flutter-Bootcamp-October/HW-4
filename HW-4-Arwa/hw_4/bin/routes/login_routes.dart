import 'package:shelf_router/shelf_router.dart';

import '../handlers/login/login_handler.dart';
import '../handlers/post/create_post_handler.dart';

class UserRoutes {
  Router get route {
    final appRoute = Router();
    appRoute
      ..get('/login', loginHandler)
      ..get('/createpost', createPostHandler);

    return appRoute;
  }
}
