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
      title: 'Switch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Switch'),
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

  bool _opcion = false;
  RadioOpciones _opcionRadio = RadioOpciones.Avion;
  Icon _iconOpcionRadio = Icon(Icons.airplanemode_active);
  Map _opcionCheckbox = {
    RadioOpciones.Coche: false,
    RadioOpciones.Avion: false,
    RadioOpciones.Barco: false
  };
  double _opcionSlider = 0;

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
          const Text("Seleccione una opcion",
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          ),
            Divider(),
            Text("Switch",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: _opcion,
                    activeColor: Colors.green,
                    activeTrackColor: Colors.green[140],
                    inactiveTrackColor: Colors.red[200],
                    inactiveThumbColor: Colors.red,
                    onChanged: (value){
                      setState(() {
                        _opcion = value;
                      });
                    }),

                CupertinoSwitch(
                    value: _opcion,
                    activeColor: Colors.green,
                    trackColor: Colors.green[140],
                    onChanged: (value){
                      setState(() {
                        _opcion = value;
                      });
                    })
              ],
            ),

            Text(
              _opcion
              ? "Activado"
              : "Desactivado"
            ),

            Divider(),
            Text("Radio", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: RadioOpciones.Coche,
                    groupValue: _opcionRadio,
                    activeColor: Colors.green,
                    onChanged: (value){
                      setState(() {
                        _opcionRadio = RadioOpciones.Coche;
                        _iconOpcionRadio = Icon(Icons.directions_car);
                      });
                    }
                ),
                Text("Coche", style: RadioOpciones.Coche == _opcionRadio
                  ? TextStyle(color: Colors.green)
                  : TextStyle(),),
                Radio(
                    value: RadioOpciones.Avion,
                    groupValue: _opcionRadio,
                    activeColor: Colors.green,
                    onChanged: (value){
                      setState(() {
                        _opcionRadio = RadioOpciones.Avion;
                        _iconOpcionRadio = Icon(Icons.airplanemode_active);
                      });
                    }
                ),
                Text("Avion", style: RadioOpciones.Avion == _opcionRadio
                    ? TextStyle(color: Colors.green)
                    : TextStyle(),),
                Radio(
                    value: RadioOpciones.Barco,
                    groupValue: _opcionRadio,
                    activeColor: Colors.green,
                    onChanged: (value){
                      setState(() {
                        _opcionRadio = RadioOpciones.Barco;
                        _iconOpcionRadio = Icon(Icons.directions_boat);
                      });
                    }
                ),
                Text("Barco", style: RadioOpciones.Barco == _opcionRadio
                    ? TextStyle(color: Colors.green)
                    : TextStyle(),),
              ],
            ),
            _iconOpcionRadio,
            Divider(),
            Text("CheckBox", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: _opcionCheckbox[RadioOpciones.Coche],
                    activeColor: Colors.green,
                    onChanged: (value){
                      setState(() {
                        _opcionCheckbox[RadioOpciones.Coche] = value;
                      });
                    }
                ),
                Text("Coche", style: _opcionCheckbox[RadioOpciones.Coche]
                    ? TextStyle(color: Colors.green)
                    : TextStyle(),),
                Checkbox(
                    value: _opcionCheckbox[RadioOpciones.Avion],
                    activeColor: Colors.green,
                    onChanged: (value){
                      setState(() {
                        _opcionCheckbox[RadioOpciones.Avion] = value;
                      });
                    }
                ),
                Text("Avion", style: _opcionCheckbox[RadioOpciones.Avion]
                  ? TextStyle(color: Colors.green)
                  : TextStyle(),),
                Checkbox(
                    value: _opcionCheckbox[RadioOpciones.Barco],
                    activeColor: Colors.green,
                    onChanged: (value){
                      setState(() {
                        _opcionCheckbox[RadioOpciones.Barco] = value;
                      });
                    }
                ),
                Text("Barco", style: _opcionCheckbox[RadioOpciones.Barco]
                    ? TextStyle(color: Colors.green)
                    : TextStyle(),),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.directions_car, color: _opcionCheckbox[RadioOpciones.Coche]
                  ? Colors.green : Colors.grey,),
                Icon(Icons.airplanemode_active, color: _opcionCheckbox[RadioOpciones.Avion]
                    ? Colors.green : Colors.grey,),
                Icon(Icons.directions_boat, color: _opcionCheckbox[RadioOpciones.Barco]
                    ? Colors.green : Colors.grey,),
              ],
            ),

            Divider(),
            Text("Slider", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            Slider(
                value: _opcionSlider,
                label: "$_opcionSlider",
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Colors.green,
                thumbColor: Colors.green,
                inactiveColor: Colors.green[100],
                onChanged: (value){
                  setState(() {
                    _opcionSlider = value;
                  });
                }
            ),

            Container(
              width: MediaQuery.of(context).size.width*0.97,
              child: CupertinoSlider(
                value: _opcionSlider,
                min: 0,
                max: 10,
                divisions: 10,
                activeColor: Colors.green,
                thumbColor: Colors.green,
                onChanged: (value){
                  setState(() {
                    _opcionSlider = value;
                  });
                },
              ),
            ),
            
            Text("El valor del slider es : ${_opcionSlider}",
            style: _opcionSlider < 5
              ? TextStyle(color: Colors.red)
              : TextStyle(color: Colors.green),
            ),

          ],
        ),
      ),
    );
  }

}

enum RadioOpciones{
  Coche,
  Avion,
  Barco
}