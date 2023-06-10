import 'package:authenticationexample/screens/register.dart';
import 'package:authenticationexample/screens/userscreen.dart';
import 'package:authenticationexample/utils/firebase_auth.dart';
import 'package:authenticationexample/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState ()=> _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  late bool _processing = false;

  @override
  void dispose() {
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen")
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
                    //---------FORMULARIO DE LOGIN--------------------
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailFieldController,
                            focusNode: _focusEmail,
                            validator: (value) => Validator.validateEmail(email: value!),
                            decoration: const InputDecoration(
                                hintText: "Email"
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            controller: _passwordFieldController,
                            focusNode: _focusPassword,
                            validator: (value) => Validator.validatePassword(password: value!),
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Password"
                            ),
                          ),

                          SizedBox(height: 12,),
                        ],
                      ),
                    ),

                    _processing
                    ? CircularProgressIndicator()
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async{
                                _focusPassword.unfocus();
                                _focusEmail.unfocus();

                                if(_formKey.currentState!.validate()){
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
                                }


                              },
                              /*style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue
                              ),*/
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                          ),
                        ),
                        const SizedBox(width: 25,),

                        Expanded(
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => RegisterScreen())
                                );
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
            return const CircularProgressIndicator();
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