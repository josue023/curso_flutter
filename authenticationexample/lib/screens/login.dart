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

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: FutureBuilder(
          future: _initFirebase(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Column(
                children: [
                  Text("Login",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  TextField(
                    controller: _emailFieldController,
                    focusNode: _focusEmail,
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),
                  ),
                  TextField(
                    controller: _passwordFieldController,
                    focusNode: _focusPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password"
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: null,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          )
                      ),
                    ],
                  )
                ],
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