import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:product_store/model/login_model.dart';

class auth {
  Future<loginResponseModel> login (LoginRequestModel lrm) async{
    http.Response response = await  http.post(
      Uri.parse(''),
      headers:{'Content-Type': 'application/json; charset=UTF-8'},
      body:lrm.toJson(),
    ).catchError((e){
      if (e is SocketException)
        throw 'no connection';
      else throw e ;
    });
    if (response.statusCode == 200) {
      return loginResponseModel.fromJson(jsonDecode(response.body));
    }
    else {
      throw 'user not found !';
    }
  }
}