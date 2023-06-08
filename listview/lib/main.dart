import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'comidas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comidas app',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Comidas App Home'),
      debugShowCheckedModeBanner: false ,
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

  List _comidas = [
    Comida("Hamburguesa", "comida rapida", Image.asset("Assets/images/hamburguesas.jpg.webp")),
    Comida("Hot dog", "comida rapida", Image.asset("Assets/images/hot_dog.webp")),
    Comida("Kfc", "comida rapida", Image.asset("Assets/images/kfc.jpg")),
    Comida("Kfc2", "comida rapida", Image.asset("Assets/images/kfc2.webp")),
    Comida("Papas", "comida rapida", Image.asset("Assets/images/papas.webp")),
    Comida("Pizza1", "pizzas", Image.asset("Assets/images/pizza1.jpg")),
    Comida("Pizza2", "pizzas", Image.asset("Assets/images/pizza2.webp")),
    Comida("Pizza casera", "pizzas", Image.asset("Assets/images/pizza_casera.jpg")),
    Comida("Sanduche", "Pan", Image.asset("Assets/images/sanduche.webp")),
    Comida("Taco de carne", "tacos", Image.asset("Assets/images/taco_carne.webp")),
    Comida("Taco mariscos", "tacos", Image.asset("Assets/images/taco_mariscos.webp")),
    Comida("Taco mixto", "tacos", Image.asset("Assets/images/taco_mixto.jpg"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _comidas.length,
          itemBuilder: (context, index){
            final item = _comidas[index];
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(item.nombre),
              background: Container(
                child: Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.white,
                ),
                color: Colors.cyan,
              ),
              onDismissed: (direction){
                setState(() {
                  _comidas.removeAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${item.nombre} ha sido borrado"))
                  );
                });
              },
              child: Card(
                color: Colors.grey[200],
                elevation: 5,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 10,
                        offset: Offset(-15, 33)
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.cyan[100]!, Colors.cyan[600]!]
                    )
                  ),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${item.nombre}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                          ),
                        ),
                        Text(
                          "${item.categoria}",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              backgroundColor: Colors.cyan[900],
                              title: Text("${item.nombre}",
                                style: TextStyle(color: Colors.white),
                              ),
                              content: item.imagen,
                            );
                          }
                      );
                    },
                  ),
                ),
              ),
            );
          }
      )
    );
  }

}
