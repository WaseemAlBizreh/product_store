import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/auth_api.dart';
import 'package:product_store/model/register_model.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';

class Register extends StatelessWidget {
  final reg = GlobalKey<FormState>();

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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/bg.jpg"),
                    fit: BoxFit.cover,
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
                                        decoration: const InputDecoration(
                                            hintText: "User Name",
                                            hintStyle: TextStyle(fontSize: 15),
                                            icon: Icon(Icons.person)),
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
                                        decoration: const InputDecoration(
                                            hintText: "Email",
                                            hintStyle: TextStyle(fontSize: 15),
                                            icon: Icon(Icons.email)),
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
                                            icon: Icon(Icons.lock),
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
                                            icon: Icon(Icons.lock),
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
                                            });
                                            print(val.reg_model.token);
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
