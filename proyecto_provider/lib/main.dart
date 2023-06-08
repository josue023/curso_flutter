import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_provider/contador_provider.dart';

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
      home: ChangeNotifierProvider(
        create: (_) => ContadorProvider(0),
        child: MyHomePage(title: "Provider App"),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final _contadorprovider = Provider.of<ContadorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_contadorprovider.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
              key: const Key("countertext"),
            ),

           TextField(
             key: Key("textfield"),
             decoration: InputDecoration(
               hintText: "Ejemplo"
             ),
           )
           /* MaterialButton(
                onPressed: _contadorprovider.increment,
                color: Colors.red,
                child: Icon(Icons.remove),
            )*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contadorprovider.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        key: const Key("increment"),
      ),

    );
  }
}
