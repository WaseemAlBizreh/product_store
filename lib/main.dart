import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ApI/product_listview.dart';
import 'Pages/register.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Product Store',
      home: ChangeNotifierProvider<ProductListView>(
          create: (_)=> ProductListView(),
          child: Home()
      ),
    );
  }
}
