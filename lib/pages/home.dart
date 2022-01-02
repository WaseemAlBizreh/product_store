import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/product_listview.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  var color1 = const Color(0xFF211940);
  var color2 = const Color(0xff5c548a);
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
                    backgroundColor: color6,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  body: Container(
                    decoration: BoxDecoration(
                      color: color3.withOpacity(0.5),
                    ),
                    child: ListView.builder(
                        itemCount: value.productslist.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            margin: const EdgeInsets.all(3),
                            child: InkWell(
                              onTap: () {},
                              child: Text(value.productslist[index].name),
                            ),
                          );
                        }),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                        label: 'home',
                        backgroundColor: color6
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                          backgroundColor: Colors.red,
                      )
                    ],),
                );
              });
        },

      ),
    );
  }
}
