import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "ScaffoldApp",
      home: MyHomePage(title: "Stepper"),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key, this.title}):super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage>{

  List<Step> steps = [
    Step(title: Text("Caja 1"), content: Text("Contenido de caja 1")),
    Step(title: Text("Caja 2"), content: Text("Contenido de caja 2")),
    Step(title: Text("Caja 3"), content: Text("Contenido de caja 3")),
    Step(title: Text("Caja 4"), content: Text("Contenido de caja 4")),
    Step(title: Text("Caja 5"), content: Text("Contenido de caja 5"))
  ];

  int _currentStep = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),

      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Stepper", style: Theme.of(context).textTheme.headlineLarge,),
              Stepper(
                  steps: steps,
                  currentStep: _currentStep,
                  onStepContinue: _pasoSiguiente,
                  onStepCancel: _pasoAnterior,
              )
            ],
          )
      ),

    );
  }

  void _pasoSiguiente(){
    setState(() {
      _currentStep++;
    });
  }

  void _pasoAnterior(){
    setState(() {
      if(_currentStep > 0){
        _currentStep--;
      }
    });
  }

}