import 'package:flutter/material.dart';
import 'package:product_store/model/add_product_model.dart';
import 'package:product_store/pages/profile.dart';
import 'package:provider/provider.dart';
import 'package:product_store/ApI/add_product.dart';

import 'home.dart';

class add_product extends StatelessWidget {
  var color1 = const Color(0xFF211940);
  var color2 = const Color(0xFF5c548a);
  var color3 = const Color(0xFF9887bc);
  var color4 = const Color(0xFFb897c1);
  var color5 = const Color(0xFFd983ca);
  var color6 = const Color(0xFF6f2dbd);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<add_products>(
      create: (_) => add_products(),
      child: Consumer<add_products>(builder: (context, val, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: color6,
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        controller: val.nameproduct,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Product Name",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.category,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Category",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.price,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Price",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.therty,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Discount Before 30 day %",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.fifteen,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Discount Before 15 day %",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.Quantity,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: " Quantity",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.Phone,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Phone Number To Connection",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.path,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "path image",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                      TextField(
                        controller: val.date,
                        autocorrect: true,
                        cursorColor: Colors.pinkAccent,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "date",
                          hintStyle: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Products_Req_Model prm = Products_Req_Model(
                category_id: val.category.text as int ,
                price: val.price.text as int ,
                name: val.nameproduct as String,
                quantity: val.Quantity as int,
                fifteen: val.fifteen as int,
                therty: val.therty as int ,
                expration_date: val.date,
                phone_number: val.Phone,
                image_path: val.path as String,
              );
              val.addproduct(prm);
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
