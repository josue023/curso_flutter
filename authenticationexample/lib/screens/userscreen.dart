import 'package:authenticationexample/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget{

  final User user;
  const UserScreen({required this.user});

  @override
  _UserScreenState createState ()=> _UserScreenState();
}

class _UserScreenState extends State<UserScreen>{

  late User _user;
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${_user.displayName}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("Email: ${_user.email}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            _user.emailVerified
            ? const Text("Email verificado",
                style: TextStyle(color: Colors.green),
              )
            : const Text("Email no verificado",
                style: TextStyle(color: Colors.red),
              ),

            _user.emailVerified
            ? Container()
            : _isSendingVerification
              ? CircularProgressIndicator()
              : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSendingVerification = true;
                      });

                      await _user.sendEmailVerification();

                      setState(() {
                        _isSendingVerification = false;
                      });
                    },
                    child: const Text("Verificar email",
                      style: TextStyle(color: Colors.white),
                    )
                )
              ],
            ),

            _isSigningOut
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: (){
                  setState(() {
                    _isSigningOut = true;
                  });

                  FirebaseAuth.instance.signOut();
                  
                  setState(() {
                    _isSigningOut = false;
                  });
                  
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                },
                child: const Text("Sign Out",
                          style: TextStyle(color: Colors.white),
                        )
            )

          ],
        ),
      ),
    );
  }
}