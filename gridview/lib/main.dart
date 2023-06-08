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
      title: 'Gridview',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Gridview App Home'),
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
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: _comidas.length,
          itemBuilder: (context, index){
            final item = _comidas.elementAt(index);
            return Card(
              color: Colors.cyan,
              elevation: 5,
              child: GestureDetector(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${item.nombre}")));
                },

                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        child: item.imagen,
                      ),

                      Divider(color: Colors.white),
                      Text(
                        "${item.nombre}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "${item.categoria}",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );



            /*GridTileBar(
              backgroundColor: Colors.cyan,
              title: Container(
                child: item.imagen,
              ),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "${item.nombre}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
            );*/
          }
      )
    );
  }

}
