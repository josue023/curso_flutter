import 'package:flutter/material.dart';
import 'package:test_digitos_wisc/providers/testprovider.dart';
import 'package:test_digitos_wisc/screens/test_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_digitos_wisc/services/test_services.dart';
import 'package:test_digitos_wisc/widgets/test_item_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => CustomTestProvider(),
        child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return MaterialApp(
            title: 'Error de conexion',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
              useMaterial3: true,
            ),
            home: Container(),
            debugShowCheckedModeBanner: false,
          );
        }

        if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return MaterialApp(
            title: 'Test Digitos Wisc',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
              useMaterial3: true,
            ),
            home: const MyHomePage(title: 'Pagina principal'),
            debugShowCheckedModeBanner: false,
          );
        }

        return CircularProgressIndicator();
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: TestServices().getStream(),
        builder: (context, tests){
          if(tests.hasError){
            Text("Error de conexión");
          }

          if(tests.hasData){
            final data = tests.data;

            if(data != null){
              return ListView.builder(
                  itemExtent: 60,
                  itemCount: data.docs.length,
                  itemBuilder: (context, index){
                    return TestItem(data.docs[index]);
                  }
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => TestScreen())
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
