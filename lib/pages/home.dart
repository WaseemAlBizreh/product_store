import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/product_listview.dart';
import 'package:provider/provider.dart';

import '../Token.dart';
var color1 = const Color(0xFF022534);
var color2 = const Color(0xFF08546c);
var color3 = const Color(0xFFa0bacc);
class Home extends StatelessWidget{
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> ProductListView(),
      child: Consumer<ProductListView>(
        builder: (context, value, child){
          return Scaffold(
            body : Center(
              child: value.widgetOptions.elementAt(value.selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: color1,
              items: const<BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label:'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label:'Profile'
                ),
              ],
              currentIndex: value.selectedIndex,
              selectedItemColor: color3,
              onTap: value.onTabItem,
            ),
          );
        },
      ),
    );
  }
  
}
class Listproduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListView>(
      builder: (context, value, child) {
        value.productlist();
        return LayoutBuilder(builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Product Store'),
              backgroundColor: color1,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                  itemCount: value.productslist.length,
                  itemBuilder: (ctx, index) {
                    print(token);
                    return Container(
                      margin: const EdgeInsets.all(3),
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff6596ff).withOpacity(0.5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: constraints.maxWidth * 0.4,
                                  child: Image.network(
                                      'https://www.gpdecor.nl/wp-content/uploads/2014/02/Product-300x232.jpg', //change value.productslist[index].image_path
                                      fit: BoxFit.fitWidth),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.1,
                                ),
                                Text(
                                  value.productslist[index].name,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: color1,
                                  ),
                                ),
                                TextButton(
                                    onPressed: null,
                                    child:Row(
                                      children: [
                                        IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.visibility),
                                        ),
                                        Text('${value.productslist[index].v}'),
                                      ],
                                    )
                                )
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
    );
  }
}
