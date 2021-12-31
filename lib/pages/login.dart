import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/pages/register.dart';
import 'package:product_store/provider/auth.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
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
                            SizedBox(
                                height: constraints.maxHeight * 0.06,
                              ),
                            Container(
                                height: constraints.maxHeight * 0.4,
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
                                            decoration: const InputDecoration(
                                                hintText: "Email",
                                                hintStyle: TextStyle(fontSize: 15),
                                                icon: Icon(Icons.email)),
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
                                            ),
                                            onPressed: () {
                                              log.currentState!.validate();
                                              print(val.email.text);
                                              print(val.pass.text);
                                              },
                                            child: const Text("Sign in")),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Don't have an account ?",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: constraints.minWidth * 0.025,
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
                                                  "Sign up", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                  constraints.minWidth * 0.033,
                                                ),
                                                )),
                                          ],
                                        ),
                                      ],
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
