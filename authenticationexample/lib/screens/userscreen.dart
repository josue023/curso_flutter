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

          ],
        ),
      ),
    );
  }
}