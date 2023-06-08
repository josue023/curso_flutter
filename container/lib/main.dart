import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ScaffoldApp",
      home: MyHomePage(title: "Container"),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("contenedor 1"),
                color: Colors.blue,
                margin: EdgeInsets.only(bottom: 30),
              ),

              Container(
                child: Text("contenedor 2"),
                color: Colors.lightGreen,
                height: 40,
                width: 40,
                margin: EdgeInsets.only(bottom: 30),
              ),

              Container(
                child: Text("contenedor 3"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle
                ),
                margin: EdgeInsets.only(bottom: 30),
              ),

              Container(
                child: Text("contenedor 4"),
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.only(bottom: 30),
              ),

              Container(
                child: Text("contenedor 5", style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                    style: BorderStyle.solid
                  ),

                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),

                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 30),
              ),

              Container(
                color: Colors.black12,
                child: Icon(Icons.car_rental),
                height: 50,
                width: 50,
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.topRight,
              ),

              Container(
                color: Colors.black12,
                child: Icon(Icons.car_rental),
                height: 50,
                width: 50,
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment(0.8, -0.5)
              )

            ],
          )
      ),

    );
  }

}
