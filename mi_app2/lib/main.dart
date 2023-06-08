import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ScaffoldApp",
      home: MyHomePage(title: "ScaffoldApp Home"),
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
    return CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Aplicacion barra de navegacion",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),

      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back_ios,
            color: Colors.white
        ),
        middle: Text("Titulo de pagina",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.shopping_bag,
            color: Colors.white
        ),
      ),
    );
  }

}