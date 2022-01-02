import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_store/model/add_product_model.dart';
import 'package:product_store/model/products_model.dart';
import 'package:http/http.dart' as http;

class add_product with ChangeNotifier{

  late Products_Res_Model _addpro ;
  Future addproduct(Products_Req_Model prm) async {
    http.Response response = await http.post(
        Uri.parse('https://pastebin.com/raw/9GNBwPN6'),
        headers: {'Accept': 'application/json',},
         body: prm.toJson(),
    ).catchError((e) {
      if (e is SocketException) {
        throw 'no Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      _addpro = Products_Res_Model.fromJson(jsonDecode(response.body));
      notifyListeners();
    }
    else{

    }
  }

  Products_Res_Model get addpro => _addpro;
}