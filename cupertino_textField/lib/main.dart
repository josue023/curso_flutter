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
      home: const MyHomePage(title: 'CupertinoTextField'),
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

  String _textoAlCambiar = "Ningun texto introducido";
  String _textoEnviado = "Ningun texto enviado";

  TextStyle style1 = TextStyle(
      color: Colors.white
  );

  TextStyle style2 = TextStyle(
      color: Colors.amber,
      fontWeight: FontWeight.bold
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
          children: <Widget>[
            const Text("Formulario",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),

            Padding(padding: EdgeInsets.all(10)),
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width*0.9,
              child: Column(
                children: [
                  Text("Introduce tu nombre"),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Introduce tu nombre"
                    ),

                    onChanged: (value){
                      setState(() {
                        setState(() {
                          //_textoAlCambiar = value;
                        });
                      });
                    },

                    onSubmitted: (value){
                      setState(() {
                        //_textoEnviado = value;
                      });
                    },
                  ),

                  Padding(padding: EdgeInsets.all(8)),
                  CupertinoTextField(
                    placeholder: "Escribe lo que quieras en cupertino",
                    onChanged: (value){
                      _textoAlCambiar = value;
                    },
                    onSubmitted: (value){
                      _textoEnviado = value;
                    },
                  ),

                  Padding(padding: EdgeInsets.all(10)),
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    //color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("1. Texto que se esta introduciendo en directo", style: style2,),
                        Text("$_textoAlCambiar", style: style1,),

                        Padding(padding: EdgeInsets.all(10)),
                        Text("2. Texto que se ha enviado en el textField", style: style2,),
                        Text("$_textoEnviado", style: style1,),
                        Padding(padding: EdgeInsets.all(10))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 25,
                              spreadRadius: 5,
                              offset: Offset(0, 15)
                          )
                        ]
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
