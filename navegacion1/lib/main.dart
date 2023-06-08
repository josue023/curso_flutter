import 'package:flutter/material.dart';
import 'package:navegacion1/pantalla_dos.dart';
import 'package:navegacion1/pantalla_tres.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pantalla 1'),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        "/route1" : (BuildContext context) => MyHomePage(title: "Pantalla 1"),
        "/route2" : (BuildContext context) => PantallaDos(title: "Pantalla 2"),
        "/route3" : (BuildContext context) => PantallaTres(title: "Pantalla 3"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown
              ),
            ),
            
            Padding(padding: EdgeInsets.all(10)),
            
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/route2");
                },
                child: Text("Ir a pantalla 2")
            ),

            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/route3");
                },
                child: Text("Ir a pantalla 3")
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
