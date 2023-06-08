//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ScaffoldApp",
      home: MyHomePage(title: "posiciones y estructura"),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key, this.title}):super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.home, color: Colors.amber,),
              Icon(Icons.android, color: Colors.amber,),
              Icon(Icons.build, color: Colors.amber,),
              Icon(Icons.phone, color: Colors.amber,),
              Icon(Icons.group, color: Colors.amber,),
              Icon(Icons.heart_broken, color: Colors.amber,)
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.home, color: Colors.deepOrange,),
              Icon(Icons.android, color: Colors.deepOrange,),
              Icon(Icons.build, color: Colors.deepOrange,),
              Icon(Icons.phone, color: Colors.deepOrange,),
              Icon(Icons.group, color: Colors.deepOrange,),
              Icon(Icons.heart_broken, color: Colors.deepOrange,)
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, color: Colors.blue,),
              Icon(Icons.android, color: Colors.blue,),
              Icon(Icons.build, color: Colors.blue,),
              Icon(Icons.phone, color: Colors.blue,),
              Icon(Icons.group, color: Colors.blue,),
              Icon(Icons.heart_broken, color: Colors.blue,)
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.home, color: Colors.red,),
              Icon(Icons.android, color: Colors.red,),
              Icon(Icons.build, color: Colors.red,),
              Icon(Icons.phone, color: Colors.red,),
              Icon(Icons.group, color: Colors.red,),
              Icon(Icons.heart_broken, color: Colors.red,)
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home, color: Colors.purple,),
              Icon(Icons.android, color: Colors.purple,),
              Icon(Icons.build, color: Colors.purple,),
              Icon(Icons.phone, color: Colors.purple,),
              Icon(Icons.group, color: Colors.purple,),
              Icon(Icons.heart_broken, color: Colors.purple,)
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home, color: Colors.green,),
              Icon(Icons.android, color: Colors.green,),
              Icon(Icons.build, color: Colors.green,),
              Icon(Icons.phone, color: Colors.green,),
              Icon(Icons.group, color: Colors.green,),
              Icon(Icons.heart_broken, color: Colors.green,)
            ],
          )
        ],
      ),

      //container----------------
      /*body: Center(
        widthFactor: 1.5,
        heightFactor: 10,
        child: Container(
          color: Colors.black,
          child: Text("Texto en container",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20
            ),
          ),
        ),
      ),*/
    );
  }

}