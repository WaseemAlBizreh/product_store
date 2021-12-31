import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_store/provider/auth.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final log = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => pro_auth(),
      child: Consumer<pro_auth>(
        builder: (context,val ,child) =>
            LayoutBuilder(
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
                            child: SingleChildScrollView(
                              child: Card(
                                margin: EdgeInsets.all(constraints.minWidth * 0.06),
                                child: Form(
                                  key:log ,
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
                                          controller: val.email,
                                          autocorrect: true,
                                          cursorColor: Colors.pinkAccent,
                                          keyboardType: TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          decoration: const InputDecoration(
                                              hintText: "Email",
                                              hintStyle: TextStyle(fontSize: 15),
                                              icon: Icon(Icons.email)),
                                          validator: (val){
                                            if (val!.isEmpty && val.contains('@')){
                                              return null;}
                                          return "Invalid E_mail" ;
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
                                          controller: val.pass,
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
                                                onPressed: () {
                                                  val.set_passvisible(!val.passvisibleC);
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
                                          controller: val.conpass,
                                          autocorrect: true,
                                          cursorColor: Colors.pinkAccent,
                                          keyboardType: TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.next,
                                          obscureText: val.passvisible,
                                          decoration: InputDecoration(
                                              hintText: "Confirm Password",
                                              hintStyle: TextStyle(fontSize: 15),
                                              icon: Icon(Icons.lock),
                                              suffixIcon: IconButton(
                                                icon: Icon(val.passvisibleC
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                val.set_passvisibleC(true);
                                                },
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
                                                borderRadius:BorderRadius.circular(35),
                                              ),
                                            ),
                                          ),
                                          onPressed: (){},
                                          child: const Text("Sign up")
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Already have an account?",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: constraints.minWidth * 0.025,
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                               Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> Login()));
                                              },
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(32.0),
                                                ),
                                              ),
                                              child: Text(
                                                "Sign in",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: constraints.minWidth * 0.033,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
