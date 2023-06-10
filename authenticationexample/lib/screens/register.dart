import 'package:authenticationexample/screens/userscreen.dart';
import 'package:authenticationexample/utils/firebase_auth.dart';
import 'package:authenticationexample/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{

  @override
  _RegisterScreenState createState () => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{

  final _formKey = GlobalKey<FormState>();
  final _nameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  late bool _processing = false;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Register",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue
                    ),
                  ),
                ),
                //--------------FORMULARIO DE REGISTER---------------
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameFieldController,
                        focusNode: _focusName,
                        validator: (value) => Validator.validateName(name: value!),
                        decoration: const InputDecoration(
                            hintText: "Name"
                        ),
                      ),
                      SizedBox(height: 8,),

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
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {

                            _focusName.unfocus();
                            _focusEmail.unfocus();
                            _focusPassword.unfocus();

                            if(_formKey.currentState!.validate()){
                              setState(() {
                                _processing = true;
                              });

                              User? user = await FireAuth.singUpUsingEmailAndPass(
                                  name: _nameFieldController.text,
                                  email: _emailFieldController.text,
                                  pass: _passwordFieldController.text
                              );

                              setState(() {
                                _processing = false;
                              });

                              if(user != null){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => UserScreen(user: user))
                                );
                              }
                            }


                          },
                          child: const Text("Sign Up", style: TextStyle(color: Colors.white),)
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}