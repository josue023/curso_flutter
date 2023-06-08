import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ScaffoldApp",
      home: MyHomePage(title: "Expanded, padding, divider"),
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

      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.amber,
              child: Text("A"),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.red,
                child: Text("B"),

              ),
            ),

            Divider(
              color: Colors.purple,
              indent: 40,
              endIndent: 60,
              thickness: 2,
              height: 40,
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text("C"),
              ),
              flex: 3,
            )
          ],
        )
      ),

    );
  }

}