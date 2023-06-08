import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Navegación'),
      debugShowCheckedModeBanner: false,
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

  final SnackBar _snackBar = SnackBar(
    content: Text("Ejemplo de texto en SnackBar"),
    duration: Duration(seconds: 4),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Ejemplo de texto en SnackBar"),
                        duration: Duration(seconds: 4),
                        backgroundColor: Colors.red,
                        action: SnackBarAction(
                            label: "Cerrar",
                            textColor: Colors.white,
                            onPressed: (){
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            }
                        ),
                      )
                  );
                },
                child: Text("Abrir SnackBar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white)
                ),
            ),

            ElevatedButton(
              onPressed: (){
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Titulo de AlertDialog"),
                        content: Text("Contenido de AlertDialog"),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Cerrar")
                          )
                        ],
                      );
                    }
                );
              },
              child: Text("Abrir AlertDialog"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  textStyle: TextStyle(color: Colors.white)
              ),
            ),

            ElevatedButton(
              onPressed: (){
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context){
                      return CupertinoAlertDialog(
                        title: Text("Titulo de CupertinoDialog"),
                        content: Text("Contenido de CupertinoDialog"),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Cerrar")
                          )
                        ],
                      );
                    }
                );
              },
              child: Text("Abrir CupertinoDialog"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(color: Colors.white)
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
