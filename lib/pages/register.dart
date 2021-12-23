import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passvisible = true;
  bool passvisibleC = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          Scaffold(
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
                        child: Card(
                          margin: EdgeInsets.all(constraints.minWidth * 0.05),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    constraints.minWidth * 0.07,
                                    constraints.minHeight * 0.03,
                                    constraints.minWidth * 0.07,
                                    constraints.minHeight * 0.02),
                                child: TextFormField(
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
                                    constraints.minHeight * 0.02),
                                child: TextFormField(
                                  autocorrect: true,
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
                                    constraints.minHeight * 0.02),
                                child: TextFormField(
                                  autocorrect: true,
                                  cursorColor: Colors.pinkAccent,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  obscureText: passvisible,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(fontSize: 15),
                                      icon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(passvisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            passvisible = !passvisible;
                                          });
                                        },
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
                                  autocorrect: true,
                                  cursorColor: Colors.pinkAccent,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  obscureText: passvisible,
                                  decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(fontSize: 15),
                                      icon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(passvisibleC
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            passvisibleC = !passvisibleC;
                                          });
                                        },
                                      )),
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(
                                          constraints.minWidth * 0.2,
                                          constraints.minHeight * 0.01,
                                          constraints.minWidth * 0.2,
                                          constraints.minHeight * 0.01),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:BorderRadius.circular(35),
                                      ),
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: const Text("Sign up")
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
