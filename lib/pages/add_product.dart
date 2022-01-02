import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class add_product extends StatelessWidget {

  var color1 = const Color(0xFF211940);
  var color2 = const Color(0xFF5c548a);
  var color3 = const Color(0xFF9887bc);
  var color4 = const Color(0xFFb897c1);
  var color5 = const Color(0xFFd983ca);
  var color6 = const Color(0xFF6f2dbd);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:color6 ,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              child:Column(
                children: [

                ],
              ),
              ),
          );
        },
      ),
    );
  }
}
