import 'package:flutter/cupertino.dart';
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
        GlobalCupertinoLocalizations.delegate,
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
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return Container(
                        child: _displayClock(),
                        height: MediaQuery.of(context).size.height/3,
                      );
                    }
                );
              },
              child: Text("Introducir fecha nacimiento"),
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
              'La fecha seleccionada es:',
              style: TextStyle(
                  fontSize: 25
              ),
            ),

            Text(
              _date == null
                  ? "Ninguna fecha seleccionada"
                  : '${_date.day}/${_date.month}/${_date.year}',
              style: _date == null
                  ? TextStyle(color: Colors.red)
                  : TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
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
                  : '${_time.hour}:${_time.minute}',
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


  Widget _displayCalendar (){
    return CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        maximumDate: DateTime.now(),
        minimumDate: DateTime(1990),
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (value){
          setState(() {
            _date = value;
          });
        }
    );
  }

  Widget _displayClock (){
    return CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (value){
          setState(() {
            _time = value;
          });
        }
    );
  }
}