import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../database/supabase.dart';

createHandler(Request req) async {
  final Map body = await jsonDecode(await req.readAsString());
  if (body.length == 2 && body["email"] != null && body["password"] != null) {
    SupaServices().supa.auth.admin.createUser(
        AdminUserAttributes(email: body["email"], password: body["password"]));

    return Response.ok("account created successfully");
  } else {
    return Response.badRequest(body: "request is invalid");
  }
}
