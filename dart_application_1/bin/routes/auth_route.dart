import 'package:shelf_router/shelf_router.dart';

import '../handlers/login_handler.dart';

class AuthRoute {
  Router get route {
    final appRoutre = Router();

    appRoutre.post("/login", loginAuthHandler);

    return appRoutre;
  }
}
