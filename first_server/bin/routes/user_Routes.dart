import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserRoutes {
  Router get route {
    final router = Router();
    router.get('/profile', _getProfileHandler);
    router.post('/update', _updateProfileHandler);
    router.get('/logout', _logoutHandler);

    return router;
  }

  Future<Response> _getProfileHandler(Request request) async {
    return Response.ok('User Profile Data');
  }

  Future<Response> _updateProfileHandler(Request request) async {
    return Response.ok('User Profile Updated');
  }

  Future<Response> _logoutHandler(Request request) async {
    return Response.ok('User Logged Out');
  }
}
