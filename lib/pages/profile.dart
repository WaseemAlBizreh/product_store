import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/auth_api.dart';
import 'package:product_store/ApI/product_listview.dart';
import 'package:provider/provider.dart';

class profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => pro_auth(),
      child: Consumer<pro_auth>(
        builder: (context, value, child) {
          return LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                title: Text('My Account'),
              ),
              body: Container(
                child: Card(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                            width: constraints.maxWidth * 0.4,
                            child:Icon (Icons.person)
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.1,
                        ),
                        Column(
                            children:[
                              Container(
                                child: ListTile(
                                  title:value.name,
                                  subtitle:value.email,
                                ),
                              ),
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child: ElevatedButton(
                                    child: Text("Log Out"),
                                    onPressed: (){
                                    },
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        EdgeInsets.fromLTRB(
                                            constraints.minWidth * 0.01,
                                            constraints.minHeight * 0.015,
                                            constraints.minWidth * 0.01,
                                            constraints.minHeight * 0.015),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(35),
                                        ),
                                      ),
                                    ),
                                  )
                              )
                            ]
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
