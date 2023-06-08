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
      home: MyHomePage(title: "mi app"),
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

  String botonPulsado = "ninguno";

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
            Text("El boton pulsado es: "),
            Text("$botonPulsado",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
                onPressed: _elevatedButtonPulsado,
                child: Text("ElevatedButton"),
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.amber,
                  shadowColor: Colors.amberAccent
                ),
            ),

            Padding(padding: EdgeInsets.all(8)),
            TextButton(
                onPressed: _textButton,
                child: Text("TextButtom"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
            ),

            Padding(padding: EdgeInsets.all(8)),
            IconButton(
                onPressed: _iconButton,
                icon: Icon(Icons.accessibility),
                color: Colors.blue,
                iconSize: 40,
            ),

            Ink(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.lightBlue
              ),
              child: IconButton(
                onPressed: _iconButton,
                icon: Icon(Icons.accessibility),
                color: Colors.white,
                iconSize: 40,
              ),
            ),

            Padding(padding: EdgeInsets.all(8)),
            OutlinedButton(
                onPressed: _outlinedButton,
                child: Text("OutlinedButton",
                    style: TextStyle(
                    color: Colors.purple
                    )
                ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1,
                  color: Colors.purple,
                  style: BorderStyle.solid
                )
              ),

            ),

            Padding(padding: EdgeInsets.all(8)),
            CupertinoButton(
                child: Text("CupertinoButton"),
                onPressed: _cupertinoButton,
                color: Colors.greenAccent,
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _floatinPulsado,
        tooltip: "Pulsame",
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _floatinPulsado(){
    _queBoton("flo");
  }

  void _elevatedButtonPulsado(){
    _queBoton("ele");
  }

  void _textButton(){
    _queBoton("tex");
  }

  void _iconButton(){
    _queBoton("ico");
  }

  void _outlinedButton(){
    _queBoton("out");
  }

  void _cupertinoButton(){
    _queBoton("cup");
  }

  void _queBoton(String boton){
    setState(() {
      switch(boton){
        case "flo":
          botonPulsado = "FloatingActionButton";
        break;
        case "ele":
          botonPulsado = "ElevatedButton";
        break;
        case "tex":
          botonPulsado = "TextButton";
        break;
        case "ico":
          botonPulsado = "IconButton";
        break;
        case "out":
          botonPulsado = "OutlinedButton";
        break;
        case "cup":
          botonPulsado = "CupertinoButton";
      }
    });
  }

}