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
      home: const MyHomePage(title: 'TextField'),
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

  TextStyle style1 = TextStyle(
      color: Colors.white,
  );

  TextStyle style2 = TextStyle(
      color: Colors.amber,
      fontWeight: FontWeight.bold
  );

  final _controller = TextEditingController();
  String _textoIntroducido = "";


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
                  children: [
                    Text("Introduce tu texto"),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Introduce tu texto"
                      ),
                      controller: _controller,
                    ),

                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      //color: Colors.blue,
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
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text("1. Texto que se esta introduciendo en directo", style: style2,),
                          Text("$_textoIntroducido", style: style1,),
                          Padding(padding: EdgeInsets.all(10))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState(){
    super.initState();
    _controller.addListener(_mostrarValorIntroducido);
    _controller.value = TextEditingValue(text: "Valor inicial");
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  void _mostrarValorIntroducido(){
    setState(() {
      _textoIntroducido = _controller.text;
    });
  }
}