import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class add_product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            child: Column(
              children: [
                Container(
                  child: Card(),
                ),
                Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
