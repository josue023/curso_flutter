import 'package:flutter/material.dart';
import 'package:navegacion1/main.dart';

class PantallaTres extends StatefulWidget {
  const PantallaTres({super.key, required this.title});

  final String title;

  @override
  State<PantallaTres> createState() => _PantallaTresState();
}

class _PantallaTresState extends State<PantallaTres> {


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
                  Navigator.pushNamed(context, "/route2");
                },
                child: Text("Ir a pantalla 2")
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}