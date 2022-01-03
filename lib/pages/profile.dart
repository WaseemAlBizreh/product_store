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
                    child: Card(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                width: constraints.maxWidth * 0.4,
                                child: const Icon(Icons.person)
                            ),
                      //       SizedBox(
                      //         width: constraints.maxWidth * 0.1,
                      //       ),
                      //       Column(children: [
                      //         Container(
                      //           child: ListTile(
                      //             title: Text(value.name.text),
                      //             subtitle: Text(value.email.text),
                      //           ),
                      //         ),
                      //         Container(
                      //             alignment: Alignment.bottomRight,
                      //             child: ElevatedButton(
                      //               child: Text("Log Out"),
                      //               onPressed: () {},
                      //               style: ButtonStyle(
                      //                 padding: MaterialStateProperty.all(
                      //                   EdgeInsets.fromLTRB(
                      //                       constraints.minWidth * 0.01,
                      //                       constraints.minHeight * 0.015,
                      //                       constraints.minWidth * 0.01,
                      //                       constraints.minHeight * 0.015),
                      //                 ),
                      //                 shape: MaterialStateProperty.all(
                      //                   RoundedRectangleBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(35),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ))
                      //       ])
                          ],
                        ),
                      ),
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
