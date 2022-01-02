import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/product_listview.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  var color1 = const Color(0xFF211940);
  var color2 = const Color(0xFF5c548a);
  var color3 = const Color(0xFF9887bc);
  var color4 = const Color(0xFFb897c1);
  var color5 = const Color(0xFFd983ca);
  var color6 = const Color(0xFF6f2dbd);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductListView(),
      child: Consumer<ProductListView>(
        builder:(context, value, child){
          value.productlist();
          return LayoutBuilder(
              builder: (context, constraints) {
                return Scaffold(
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: Container(
                    child: ListView.builder(
                        itemCount: value.productslist.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            margin: const EdgeInsets.all(3),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                child: Card(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: constraints.maxWidth * 0.4,
                                        child: Image.network(
                                            'https://www.gpdecor.nl/wp-content/uploads/2014/02/Product-300x232.jpg', //change value.productslist[index].image_path
                                            fit: BoxFit.fitWidth),
                                      ),
                                      Text(value.productslist[index].name),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                );
              });
        },

      ),
    );
  }
}
