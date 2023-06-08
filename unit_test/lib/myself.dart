import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myself extends StatelessWidget{
  final int age;
  final String name;

  const Myself(this.age, this.name);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Text("$age"),
            Text("$name"),
            const Icon(Icons.camera)
          ],
        ),
      ),
    );
  }

}