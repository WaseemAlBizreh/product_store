import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/auth_api.dart';
import 'package:product_store/ApI/product_listview.dart';
import 'package:provider/provider.dart';

class profile extends StatelessWidget {
  var color1 = const Color(0xFF022534);
  var color2 = const Color(0xFF08546c);
  var color3 = const Color(0xFFa0bacc);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<pro_auth>(
      create: (_) => pro_auth(),
      child: Consumer<ProductListView>(
        builder: (context, val, child)
        {
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
                    child:Row(
                          children: [
                            Container(
                                width: constraints.maxWidth * 0.4,
                                margin: EdgeInsets.all(0.2),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/image/per.png"),
                                ),
                      ),
                            ListTile(
                              title: value.name,
                              subtitle: value.email,
                            )
                     ]
                    ),
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
