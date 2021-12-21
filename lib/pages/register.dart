import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: constraints.maxHeight *0.1,),
              Container(
                width: double.infinity,
                height: constraints.maxHeight * 0.3,
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/image/logo.png"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                  height: constraints.maxHeight * 0.6,
                  child : Card (
                    margin: EdgeInsets.all(constraints.minWidth *0.04),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(constraints.minWidth * 0.1),
                          child: TextFormField(
                            autocorrect: true,
                            cursorColor: Colors.pinkAccent,
                            keyboardType: TextInputType.text,
                          ),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
