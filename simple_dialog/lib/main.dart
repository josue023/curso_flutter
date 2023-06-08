import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Stateful App",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget{
  String title = "SimpleDialog App";

  State createState(){
    return _MyHome();
  }
}

class _MyHome extends State<MyHome>{
  String _opcion = "Ninguna";
  List<Icon> _iconos = [
    Icon(Icons.directions_car),
    Icon(Icons.airplanemode_active),
    Icon(Icons.directions_boat)
  ];

  Icon _iconoElegido = Icon(Icons.filter_none);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _elegirOpcion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(color: Colors.white)
                ),
                child: Text("Abrir SimpleDialog")
            ),
            Padding(padding: EdgeInsets.all(15)),
            Text("La elección es: ", style: TextStyle(color: Colors.indigo, fontSize: 20)),
            Padding(padding: EdgeInsets.all(15)),
            Text("$_opcion", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            _iconoElegido
          ],
        ),
      ),
    );
  }

  Future<void> _elegirOpcion() async{
    switch(
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text("Seleccione una opción de transporte"),
            children: [
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.directions_car),
                    Text(" Coche")
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Coche);
                },
              ),

              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.airplanemode_active),
                    Text(" Avion")
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Avion);
                },
              ),

              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.directions_boat),
                    Text(" Barco")
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Barco);
                },
              )
            ],
          );
        }
      )
    ){
      case ListaOpciones.Coche:
        _opcionElegida("Coche", 0);
      break;
      case ListaOpciones.Avion:
        _opcionElegida("Avión", 1);
      break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco", 2);

    }
  }

  void _opcionElegida(String opcion, int icono){
    setState(() {
      _opcion = opcion;
      _iconoElegido = _iconos[icono];
    });
  }

}

enum ListaOpciones{
  Coche,
  Avion,
  Barco
}
