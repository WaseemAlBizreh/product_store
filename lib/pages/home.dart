import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,child) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (ctx,index){
                    return Container(
                      margin: EdgeInsets.all(3),
                      child: InkWell(
                          onTap: () {},
                          child:Text('hello') ,
                      ),
                    );
                  }),
            ),
          );
        }
    );
  }
}
