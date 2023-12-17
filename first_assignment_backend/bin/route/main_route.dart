import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../handlers/login_handler.dart';
import '../../handlers/root_default_handler.dart';
import 'token_route.dart';

class MainRoutes {
  Router get route {
    final appRoute = Router();

    appRoute
      ..get('/', rootDefaultHandler)
      ..post('/login', loginHandler)
      ..mount('/user', TokenRoutes().route)
      ..all('/<ignored|.*>', (Request req) {
        return Response.ok('Sorry your page not found');
      });


    return appRoute;
  }
}

