import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:product_store/model/add_product_model.dart';
import 'package:http/http.dart' as http;
import '../Token.dart';

class add_products with ChangeNotifier {
  late Products_Res_Model _addpro;

  var _nameproductcontroller = TextEditingController();
  var _categorycontroller = TextEditingController();
  var _pricecontroller = TextEditingController();
  var _thertycontroller = TextEditingController();
  var _fifteencontroller = TextEditingController();
  var _Quantitycontroller = TextEditingController();
  var _Phonecontroller = TextEditingController();

  Future addproduct(Products_Req_Model prm) async {
    http.Response response = await http.post(
      Uri.parse('https://pastebin.com/raw/9GNBwPN6'),
      headers: {
        'Accept': 'application/json',
        'Authorization' : 'Barer ${token}',
      },
      body: prm.toJson(),
    )
        .catchError((e) {
      if (e is SocketException) {
        throw 'no Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      _addpro = Products_Res_Model.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else {}
  }

  Products_Res_Model get addpro => _addpro;

  get Phone => _Phonecontroller;

  set_Phone(String value) {
    _Phonecontroller.text = value;
    notifyListeners();
  }

  get Quantity => _Quantitycontroller;

  set_Quantity(String value) {
    _Quantitycontroller.text = value;
    notifyListeners();
  }

  get fifteen => _fifteencontroller;

  set_fifteen(String value) {
    _fifteencontroller.text = value;
    notifyListeners();
  }

  get therty => _thertycontroller;

  set_therty(String value) {
    _thertycontroller.text = value;
    notifyListeners();
  }

  get price => _pricecontroller;

  set_price(String value) {
    _pricecontroller.text = value;
    notifyListeners();
  }

  get category => _categorycontroller;

  set_category(String value) {
    _categorycontroller.text=value;
    notifyListeners();
  }

  get nameproduct => _nameproductcontroller;

  set_nameproduct(String value) {
    _nameproductcontroller.text = value;
    notifyListeners();
  }
}
