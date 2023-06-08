import 'package:flutter/cupertino.dart';
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
  String _botonPulsado = "Ninguno";

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

            ElevatedButton(
                onPressed: _elegirOpcionBottomSheet,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(color: Colors.white)
                ),
                child: Text("Abrir BottomSheet")
            ),

            ElevatedButton(
                onPressed: _elegirActionSheetCupertino,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(color: Colors.white)
                ),
                child: Text("Abrir ActionSheetCupertino")
            ),
            Padding(padding: EdgeInsets.all(15)),
            Text("La elección de $_botonPulsado es: ", style: TextStyle(color: Colors.indigo, fontSize: 20)),
            Padding(padding: EdgeInsets.all(15)),
            Text("$_opcion", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
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
        _opcionElegida("Coche", 1);
        break;
      case ListaOpciones.Avion:
        _opcionElegida("Avión", 1);
        break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco", 1);

    }
  }

  Future<void> _elegirOpcionBottomSheet() async{
    switch( await showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Seleccione una opcion", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Divider(),
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

                Divider(),
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

                Divider(),
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
                ),

                ],
              ),
          );
        }
    )

    ){
      case ListaOpciones.Coche:
        _opcionElegida("Coche", 2);
        break;
      case ListaOpciones.Avion:
        _opcionElegida("Avión", 2);
        break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco", 2);

    }
  }

  Future<void> _elegirActionSheetCupertino() async{
    switch(await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context){
          return  CupertinoActionSheet(
            title: Text("Elige una opcion: "),
            actions: [
              CupertinoActionSheetAction(
                  onPressed: (){
                    Navigator.pop(context, ListaOpciones.Coche);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.directions_car),
                      Text(" Coche")
                    ],
                  ),
              ),

              CupertinoActionSheetAction(
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Avion);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.airplanemode_active),
                    Text(" Avion")
                  ],
                ),
              ),

              CupertinoActionSheetAction(
                onPressed: (){
                  Navigator.pop(context, ListaOpciones.Barco);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.directions_boat),
                    Text(" Barco")
                  ],
                ),
              )
            ],
          );
        }
    )

    ){
      case ListaOpciones.Coche:
        _opcionElegida("Coche", 3);
        break;
      case ListaOpciones.Avion:
        _opcionElegida("Avión", 3);
        break;
      case ListaOpciones.Barco:
        _opcionElegida("Barco", 3);

    }
  }

  void _opcionElegida(String opcion, int identificador){
    setState(() {
      switch(identificador){
        case 1:
          _botonPulsado = "SimpleDialog";
        break;
        case 2:
          _botonPulsado = "BottomSheet";
        break;
        case 3:
          _botonPulsado = "ActionSheetCupertino";
      }
      _opcion = opcion;
    });
  }

}

enum ListaOpciones{
  Coche,
  Avion,
  Barco
}
