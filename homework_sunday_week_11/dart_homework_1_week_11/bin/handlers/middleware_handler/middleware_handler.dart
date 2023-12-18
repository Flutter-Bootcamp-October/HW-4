import 'dart:convert';

import 'package:shelf/shelf.dart';

Middleware checkAuth() => ((innerHandler) => (Request req) async {
      final response = jsonDecode(await req.readAsString());
      print('======${response['token']}===========');

      if (response['token'] == null &&
          response['email'] != 'Koala@gmail.com' &&
          response['password'] != '123321') {
        return Response.unauthorized('Email or/and password not correct');
      } else if (response['email'] == 'Koala@gmail.com' &&
          response['password'] == '123321') {
        return innerHandler(req);
      } else if (response['token'] == 'to102kjh7jfd') {
        return innerHandler(req);
      } else if (response['token'] != 'to102kjh7jfd') {
        return Response.unauthorized('You do not have a permissin');
      }
      return Response.unauthorized('Error!');
    });
