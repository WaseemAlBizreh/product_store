import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/ApI/auth_api.dart';
import 'package:product_store/model/login_model.dart';
import 'package:product_store/pages/register.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  var color1 = const Color(0xFF211940);
  var color2 = const Color(0xFF5c548a);
  var color3 = const Color(0xFF9887bc);
  var color4 = const Color(0xFFb897c1);
  var color5 = const Color(0xFFd983ca);
  var color6 = const Color(0xFF6f2dbd);

  final log = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => pro_auth(),
      child: Consumer<pro_auth>(
          builder: (context, val, child) {
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
                            SizedBox(
                              height: constraints.maxHeight * 0.06,
                            ),
                            Container(
                                height: constraints.maxHeight * 0.4,
                                child: SingleChildScrollView(
                                  child: Card(
                                    margin: EdgeInsets.all(constraints.minWidth * 0.06),
                                    child: Form(
                                      key: log,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                constraints.minWidth * 0.068,
                                                constraints.minHeight * 0.03,
                                                constraints.minWidth * 0.068,
                                                constraints.minHeight * 0.01),
                                            child: TextFormField(
                                              controller: val.email,
                                              onFieldSubmitted: val.set_email,
                                              autocorrect: true,
                                              validator: (value) {
                                                if (value!.isEmpty || !value.contains('@')) {
                                                  return 'enter valid email';
                                                }
                                              },
                                              cursorColor: Colors.pinkAccent,
                                              keyboardType: TextInputType.emailAddress,
                                              textInputAction: TextInputAction.next,
                                              decoration: InputDecoration(
                                                  hintText: "Email",
                                                  hintStyle: TextStyle(fontSize: 15),
                                                  icon: Icon(
                                                    Icons.email,
                                                    color: color6,
                                                  )),
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
                                              validator: (val) {
                                                if (val!.isEmpty || val.length < 8) {
                                                  return 'Enter Valid Password';
                                                }
                                              },
                                              autocorrect: true,
                                              cursorColor: Colors.pinkAccent,
                                              keyboardType: TextInputType.visiblePassword,
                                              textInputAction: TextInputAction.next,
                                              obscureText: val.passvisible,
                                              decoration: InputDecoration(
                                                  hintText: "Password",
                                                  hintStyle: const TextStyle(fontSize: 15),
                                                  icon: Icon(Icons.lock,color: color6,),
                                                  suffixIcon: IconButton(
                                                    icon: Icon(val.passvisible
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                    onPressed: val.set_passvisible,
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
                                                    borderRadius: BorderRadius.circular(35),
                                                  ),
                                                ),
                                                backgroundColor:MaterialStateProperty.all(color6),
                                              ),
                                              onPressed: () {
                                                if(log.currentState!.validate()){
                                                  LoginRequestModel loginM = LoginRequestModel(
                                                      val.email.text ,val.pass.text);
                                                  val.login(loginM).catchError((e){
                                                    Fluttertoast.showToast(
                                                        msg: e.toString(),
                                                        toastLength: Toast.LENGTH_LONG,
                                                        gravity: ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor: Colors.redAccent,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0
                                                    );
                                                  });
                                                  print(val.log_model.token);
                                                }},
                                              child:const Text("Sign in")),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Don't have an account ?",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: constraints.minWidth * 0.035,
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pushReplacement(context,
                                                        MaterialPageRoute(
                                                            builder: (_) => Register()));},
                                                  style: TextButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(32.0),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Sign up",
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
                });
          }),
    );
  }
}
