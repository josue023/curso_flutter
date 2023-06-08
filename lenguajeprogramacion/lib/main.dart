import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lenguajeprogramacion/widgets/connection_error_widget.dart';
import 'package:lenguajeprogramacion/widgets/custom_floatingactionbutton_widget.dart';
import 'package:lenguajeprogramacion/widgets/lenguajes_list_widget.dart';

void main(){
  runApp(LenguajesProgramacion());
}

class LenguajesProgramacion extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(title: Text("Lenguajes Programacion"),),
                body: ConnectionError(),
              ),
            );
          }

          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(title: Text("Lenguajes Programacion"),),
                body: LenguajeListWidget(),
                floatingActionButton: CustomFloatingActionButton(),
              ),
            );
          }

          return CircularProgressIndicator();
        }
    );
  }
}
