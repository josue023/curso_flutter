import 'dart:io';

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
      home: MyHomePage(title: "Deteccion de plataformas"),
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
  Icon _corazon = Icon(Icons.favorite_border, color: Colors.white);
  bool _liked = false;
  int _elementoSeleccionado = 0;
  String textoAVisualizar = "0 : Home";

  @override
  Widget build(BuildContext context){
    return Platform.isIOS ? cupertino() : material();
  }

  Widget material(){
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
        actions: [
          IconButton(
              onPressed: _likedChange,
              icon: _corazon
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            DrawerHeader(
                child: Text(
                  "Menú Drawer",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            Text("Enlace 1"),
            Text("Enlace 2"),
            Text("Enlace 3"),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textoAVisualizar,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){_likedChange();},
        backgroundColor: Colors.red,
        icon: _corazon,
        label: const Text("Liked!"),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: "Mi cuenta"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment,
                color: Colors.white,
              ),
              label: "Estadisticas"
          ),
        ],
        currentIndex: _elementoSeleccionado,
        onTap: _itemPulsado,
      ),
    );
  }

  Widget cupertino(){
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

  _likedChange(){
    setState(() {
      if(_liked){
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _liked = false;
      }else{
        _corazon = Icon(Icons.favorite, color: Colors.white);
        _liked = true;
      }
    });
  }

  void _itemPulsado(int index){
    setState(() {
      _elementoSeleccionado = index;
      switch(_elementoSeleccionado){
        case 0:
          textoAVisualizar = "0 : Home";
        break;
        case 1:
          textoAVisualizar = "1 : Mi cuenta";
        break;
        case 2:
          textoAVisualizar = "2 : Estadisticas";
        break;

      }
    });
  }
}

