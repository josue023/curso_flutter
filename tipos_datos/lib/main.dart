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
      home: const MyHomePage(title: 'Tipo de datos'),
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
      body: SingleChildScrollView(
        child: Center(
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
                  children: const [
                    Text("Introduce tu contraseña"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Introduce tu contraseña"
                      ),
                      obscureText: true,
                    ),

                    Padding(padding: EdgeInsets.all(8)),
                    Text("Introduce tu datetime"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Introduce tu datetime"
                      ),
                      keyboardType: TextInputType.datetime,
                    ),

                    Padding(padding: EdgeInsets.all(8)),
                    Text("Introduce tu email"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Introduce tu email"
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    Padding(padding: EdgeInsets.all(8)),
                    Text("Introduce tu telefono"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Introduce tu telefono"
                      ),
                      keyboardType: TextInputType.phone,
                    ),

                    Padding(padding: EdgeInsets.all(8)),
                    Text("Introduce tu url"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Introduce tu url"
                      ),
                      keyboardType: TextInputType.url,
                    ),
                  ]
                ),
              ),

            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

