import 'package:shelf/shelf.dart';
import 'dart:io';

loginHandler(Request req) async {
  // File file = File('bin/database/database.txt');
  // List<String> lines = file.readAsLinesSync();
  // final body = jsonDecode(await req.readAsString());
  // bool found = false;
  // final token = Random().nextInt(2000);
  // String content = "";
  // for (var l in lines) {
  //   List temp = l.split(",");
  //   if (temp[0] == body["email"] && temp[1] == body["password"]) {
  //     temp[2] = token.toString();
  //     //rewrite file
  //     l = temp.join(",");
  //     print(l);
  //     found = true;
  //   }
  //   content += "$l\n";
  // }
  // handlerHelper(file, content);
  // if (found) {
  //   return Response.ok("login successful. You token is: $token");
  // }
  // return Response.badRequest(body: "Invalid Credintials");
  return Response.ok(await req.readAsString());
}

handlerHelper(File x, String c) {
  x.writeAsStringSync(c);
}
