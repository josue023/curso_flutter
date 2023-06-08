import 'package:flutter/material.dart';
import 'package:navegacion1/pantalla_tres.dart';

class PantallaDos extends StatefulWidget {
  const PantallaDos({super.key, required this.title});

  final String title;

  @override
  State<PantallaDos> createState() => _PantallaDosState();
}

class _PantallaDosState extends State<PantallaDos> {


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
                  Navigator.pushNamed(context, "/route1");
                },
                child: Text("Ir a pantalla 1")
            ),

            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/route3");
                },
                child: Text("ir a pantalla 3")
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}