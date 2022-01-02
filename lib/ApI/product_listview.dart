import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_store/model/products_model.dart';
import 'package:http/http.dart' as http;
import 'package:product_store/pages/home.dart';
import 'package:product_store/pages/profile.dart';

import '../Token.dart';

class ProductListView with ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    Listproduct(),
    profile(),
  ];

  void onTabItem(int index){
    selectedIndex = index;
    notifyListeners();
  }

  ProductListView() {
    productlist();
  }

  List<Products_Response_Model> _productslist = [];
  List<Products_Response_Model> get productslist => _productslist;
  Future productlist() async {
    http.Response response = await http.get(
      Uri.parse('https://pastebin.com/raw/9GNBwPN6'),
      headers: {
        'Accept': 'application/json',
        'Authorization' : token,
      },
    ).catchError((e) {
      if (e is SocketException) {
        throw 'no Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      product_list_view listview = product_list_view.fromJson(
          jsonDecode(response.body));
      List<Products_Response_Model> productslist = listview.products.map((e) =>
          Products_Response_Model.fromJson(e)).toList();
      _productslist = productslist;
      notifyListeners();
    } else {
      throw "Error : Can't load products";
    }
  }
}