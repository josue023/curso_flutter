import 'package:authenticationexample/screens/userscreen.dart';
import 'package:authenticationexample/utils/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState ()=> _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _processing = false;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: FutureBuilder(
          future: _initFirebase(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Login",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue
                        ),
                      ),
                    ),
                    TextField(
                      controller: _emailFieldController,
                      focusNode: _focusEmail,
                      decoration: const InputDecoration(
                          hintText: "Email"
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextField(
                      controller: _passwordFieldController,
                      focusNode: _focusPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password"
                      ),
                    ),

                    SizedBox(height: 12,),
                    _processing
                    ? CircularProgressIndicator()
                    :Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async{
                                _focusPassword.unfocus();
                                _focusEmail.unfocus();

                                setState(() {
                                  _processing = true;
                                });

                                User? user = await FireAuth.singInUsingEmailAndPass(
                                    email: _emailFieldController.text,
                                    password: _passwordFieldController.text
                                );

                                setState(() {
                                  _processing = false;
                                });

                                if(user != null){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => UserScreen(user: user)
                                    )
                                  );
                                }

                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              )
                          ),
                        ),
                        SizedBox(width: 25,),

                        Expanded(
                          child: ElevatedButton(
                              onPressed: (){

                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<FirebaseApp> _initFirebase () async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}