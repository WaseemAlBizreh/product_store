import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/auth_api.dart';
import 'package:product_store/ApI/product_listview.dart';
import 'package:provider/provider.dart';

import 'add_product.dart';

class profile extends StatelessWidget {
  var color1 = const Color(0xFF022534);
  var color2 = const Color(0xFF08546c);
  var color3 = const Color(0xFFa0bacc);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<pro_auth>(
      create: (_) => pro_auth(),
      child: Consumer<ProductListView>(
        builder: (context, val, child) {
          return Consumer<pro_auth>(
            builder: (context, value, child) {
              return LayoutBuilder(builder: (context, constraints) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('My Account'),
                  ),
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: color2,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: null,
                          child: Container(
                            height: constraints.maxHeight * 0.25,
                            color: color3,
                            child: Row(
                              children: [
                                Container(
                                  width: constraints.maxWidth * 0.4,
                                  child: Image.asset(
                                      "assets/image/per.jpg", //change value.productslist[index].image_path
                                      fit: BoxFit.fitWidth),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.1,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("User name : ${value.name.text}"),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.01,
                                    ),
                                    Text("Email : ${value.email.text}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => add_product()));
                    },
                    child: const Icon(Icons.add),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}
