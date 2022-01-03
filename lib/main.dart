import 'package:flutter/material.dart';
import 'package:product_store/Token.dart';
import 'package:product_store/pages/login.dart';
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
      home: token == "" ? Login() : Home(),
    );
  }
}
