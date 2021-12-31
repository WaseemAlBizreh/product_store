import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_store/model/login_model.dart';
import 'package:product_store/model/register_model.dart';

class pro_auth with ChangeNotifier{
  var _namecontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _passcontroller = TextEditingController();
  var _conpasscontroller = TextEditingController();
  late loginResponseModel _log;
  late RegisterResponseModel _reg;

  get log_model => _log;
  get reg_model => _reg;

  bool _passvisible = true;
  bool _passvisibleC = true;

  get name => _namecontroller;
  set_name(String value) {
    _namecontroller.text = value;
    notifyListeners();
  }

  get email => _emailcontroller;
  set_email(String value) {
    _emailcontroller.text = value;
    notifyListeners();
  }

  get conpass => _conpasscontroller;

  set_conpass(String value) {
    _conpasscontroller.text = value;
    notifyListeners();
  }

  get pass => _passcontroller;
  set_pass(String value) {
    _passcontroller.text = value;
    notifyListeners();
  }

  bool get passvisible => _passvisible;

  set_passvisible() {
    _passvisible = !_passvisible;
    notifyListeners();
  }

  bool get passvisibleC => _passvisibleC;
  set_passvisibleC() {
    _passvisibleC = !_passvisibleC;
    notifyListeners();
  }

  Future login (LoginRequestModel lrm) async{
    http.Response response = await  http.post(
      Uri.parse('https://reqres.in/api/login'),
      headers:{'Accept': 'application/json'},
      body:lrm.toJson(),
    ).catchError((e){
      if (e is SocketException) {
        throw 'no connection';
      } else {
        throw e ;
      }
    });
    if (response.statusCode == 200) {
      _log = loginResponseModel.fromJson(jsonDecode(response.body));
      notifyListeners();
    }
    if (response.statusCode == 400){
      throw 'User not found';
    }
    if (response.statusCode == 401){
      throw 'UnAuthrization';
    }
    else {
      throw 'Error : ${response.statusCode}';
    }
  }

  Future register (RegisterRequestModel rrm) async{
    http.Response response = await  http.post(
      Uri.parse(''),
      headers:{
        'Accept': 'application/json'
      },
      body:rrm.toJson(),
    ).catchError((e){
      if (e is SocketException) {
        throw 'no connection';
      } else {
        throw e ;
      }
    });
    if (response.statusCode == 200) {
      _reg = RegisterResponseModel.fromjson(jsonDecode(response.body));
      notifyListeners();
    }
    else {
      throw 'Error : ${response.statusCode}';
    }
  }
}