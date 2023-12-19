import 'dart:math';

String randomToken() {
  return "${Random().nextInt(9999)}${Random().nextInt(9999)}";
}

//---------------old---------------
// postRouteHandler(Request req) async {
//   final tokenPath = 'token.txt';
//   final File tokenFile = File(tokenPath);
//   final token = await tokenFile.readAsString();
//   if (req.headers["token"] == token) {
//     return Response.ok("valid token 22");
//   }
//   return Response.unauthorized("token not valid 22");
// }


