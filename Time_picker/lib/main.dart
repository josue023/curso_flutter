import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      home: const MyHomePage(title: 'Fecha y hora'),
      debugShowCheckedModeBanner: false ,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("es", "ES")
      ],
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

  var _date = null;
  var _time = null;

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
            ElevatedButton(
              onPressed: _seleccionarHora,
              child: Text("Introducir hora nacimiento"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  )
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Text(
              'La hora seleccionada es:',
              style: TextStyle(
                  fontSize: 25
              ),
            ),

            Text(
              _time == null
                  ? "Ninguna hora seleccionada"
                  : '${_time.format(context)}',
              style: _time == null
                  ? TextStyle(color: Colors.red)
                  : TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _seleccionarFecha () async{
    DateTime? _fechaSeleccionada = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now()
    );

    setState(() {
      if(_fechaSeleccionada != null){
        _date = _fechaSeleccionada;
      }
    });

  }


  Future _seleccionarHora () async{
    TimeOfDay? _horaSeleccionada = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );

    setState(() {
      _time = _horaSeleccionada;
    });
  }
}
