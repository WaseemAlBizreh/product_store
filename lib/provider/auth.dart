import 'package:flutter/material.dart';

class pro_auth with ChangeNotifier{

  var _namecontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _passcontroller = TextEditingController();
  var _conpasscontroller = TextEditingController();
  bool _passvisible = true;
  bool _passvisibleC = true;


  get name => _namecontroller;
  set_name(value) {
    _namecontroller = value;
    notifyListeners();
  }

  get email => _emailcontroller;

  set_email(value) {
    _emailcontroller = value;
    notifyListeners();
  }

  get conpass => _conpasscontroller;

  set_conpass(value) {
    _conpasscontroller = value;
    notifyListeners();
  }

  get pass => _passcontroller;

  set_pass(value) {
    _passcontroller = value;
    notifyListeners();
  }

  bool get passvisible => _passvisible;

  set_passvisible(bool value) {
    _passvisible = !_passvisible;
    notifyListeners();
  }

  bool get passvisibleC => _passvisibleC;

  set_passvisibleC(bool value) {
    _passvisibleC = value;
    notifyListeners();
  }
}