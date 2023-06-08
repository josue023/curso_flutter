import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPS Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GPS Home Page'),
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

  Location _location = Location();
  LocationData? _locationData;

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
            Text("Posicion actual: "),
            Text(
              _locationData == null
                  ? "No hay localizacion"
                  : "Longitud: ${_locationData!.longitude}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              _locationData == null
                  ? "No hay localizacion"
                  : "Latitud: ${_locationData!.latitude}",
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    _encontrarLocalizacion();
  }

  Future _encontrarLocalizacion() async {
    try{
      _locationData = await _location.getLocation();
      setState(() {});
    }catch(e){
      print(e);
    }
  }

}
