import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/auth_api.dart';
import 'package:product_store/model/register_model.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Token.dart';
import 'home.dart';
import 'login.dart';

class Register extends StatelessWidget {
  final reg = GlobalKey<FormState>();
  var color1 = const Color(0xFF211940);
  var color2 = const Color(0xFF5c548a);
  var color3 = const Color(0xFF9887bc);
  var color4 = const Color(0xFFb897c1);
  var color5 = const Color(0xFFd983ca);
  var color6 = const Color(0xFF6f2dbd);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => pro_auth(),
      child: Consumer<pro_auth>(builder: (context, val, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [color1,color3, color2,color5]
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.1,
                      ),
                      Container(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.3,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/image/logo.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Container(
                          height: constraints.maxHeight * 0.55,
                          child: SingleChildScrollView(
                            child: Card(
                              margin: EdgeInsets.all(constraints.minWidth * 0.06),
                              child: Form(
                                key: reg,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          constraints.minWidth * 0.068,
                                          constraints.minHeight * 0.03,
                                          constraints.minWidth * 0.068,
                                          constraints.minHeight * 0.01),
                                      child: TextFormField(
                                        controller: val.name,
                                        onFieldSubmitted: val.set_name,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Empty UserName';
                                          }
                                        },
                                        autocorrect: true,
                                        cursorColor: Colors.pinkAccent,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                            hintText: "User Name",
                                            hintStyle: const TextStyle(fontSize: 15),
                                            icon: Icon(Icons.person, color: color6,)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          constraints.minWidth * 0.07,
                                          constraints.minHeight * 0.02,
                                          constraints.minWidth * 0.07,
                                          constraints.minHeight * 0.01),
                                      child: TextFormField(
                                        onFieldSubmitted: val.set_email,
                                        controller: val.email,
                                        autocorrect: true,
                                        cursorColor: Colors.pinkAccent,
                                        keyboardType: TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                            hintText: "Email",
                                            hintStyle: const TextStyle(fontSize: 15),
                                            icon: Icon(Icons.email , color: color6,)),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !value.contains('@')) {
                                            return 'enter valid email';
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          constraints.minWidth * 0.07,
                                          constraints.minHeight * 0.02,
                                          constraints.minWidth * 0.07,
                                          constraints.minHeight * 0.01),
                                      child: TextFormField(
                                        onFieldSubmitted: val.set_pass,
                                        controller: val.pass,
                                        autocorrect: true,
                                        cursorColor: Colors.pinkAccent,
                                        keyboardType:
                                        TextInputType.visiblePassword,
                                        textInputAction: TextInputAction.next,
                                        obscureText: val.passvisible,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 8) {
                                            return 'Enter Valid Password';
                                          }
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            hintStyle: TextStyle(fontSize: 15),
                                            icon: Icon(Icons.lock , color: color6,),
                                            suffixIcon: IconButton(
                                              icon: Icon(val.passvisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: val.set_passvisible,
                                            )),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          constraints.minWidth * 0.07,
                                          constraints.minHeight * 0.02,
                                          constraints.minWidth * 0.07,
                                          constraints.minHeight * 0.02),
                                      child: TextFormField(
                                        onFieldSubmitted: val.set_conpass,
                                        controller: val.conpass,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 8) {
                                            return 'Enter Valid Password';
                                          }
                                          if (value != val.pass.text) {
                                            return 'Not Match';
                                          }
                                        },
                                        autocorrect: true,
                                        cursorColor: Colors.pinkAccent,
                                        keyboardType:
                                        TextInputType.visiblePassword,
                                        textInputAction: TextInputAction.next,
                                        obscureText: val.passvisibleC,
                                        decoration: InputDecoration(
                                            hintText: "Confirm Password",
                                            hintStyle: TextStyle(fontSize: 15),
                                            icon: Icon(Icons.lock , color: color6,),
                                            suffixIcon: IconButton(
                                              icon: Icon(val.passvisibleC
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: val.set_passvisibleC,
                                            )),
                                      ),
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.fromLTRB(
                                                constraints.minWidth * 0.28,
                                                constraints.minHeight * 0.015,
                                                constraints.minWidth * 0.28,
                                                constraints.minHeight * 0.015),
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(35),
                                            ),
                                          ),
                                          backgroundColor:MaterialStateProperty.all(color6),
                                        ),
                                        onPressed: () {
                                          if (reg.currentState!.validate()) {
                                            String name = val.name.text;
                                            String email = val.email.text;
                                            String pass = val.pass.text;
                                            String conpass = val.conpass.text;
                                            RegisterRequestModel registerM =
                                            RegisterRequestModel(
                                                name, email, pass, conpass);
                                            val.register(registerM).catchError((e) {
                                              Fluttertoast.showToast(
                                                  msg: e.toString(),
                                                  toastLength: Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0
                                              );
                                              print(token);
                                            });
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (_) {
                                                  return Home();
                                                }));
                                          }
                                        },
                                        child: const Text("Sign up")),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already have an account?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                            constraints.minWidth * 0.035,
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => Login()));
                                            },
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(32.0),
                                              ),
                                            ),
                                            child: Text(
                                              "Sign in",
                                              style: TextStyle(
                                                color: color6,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                constraints.minWidth * 0.033,
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: constraints.minHeight *  0.02,),
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
