import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_store/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductListView with ChangeNotifier {

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
        }
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
      throw Exception('Failed to load products');
    }
  }
}