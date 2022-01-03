import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Token.dart';

class log_out with ChangeNotifier {
  Future login() async {
    http.Response response = await http.get(
      Uri.parse(''),
      headers: {
        'Accept': 'application/json',
        'Authorization' : 'Bearer ${token}',
      },
    ).catchError((e) {
      if (e is SocketException) {
        throw 'no connection';
      } else {
        throw e;
      }
    });
    if (response.statusCode == 200) {
      token="";

    }
  }
}