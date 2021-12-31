import 'package:flutter/material.dart';

class pro_auth with ChangeNotifier{

  var _namecontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _passcontroller = TextEditingController();
  var _conpasscontroller = TextEditingController();

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
}