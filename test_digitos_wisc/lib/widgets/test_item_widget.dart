import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_digitos_wisc/services/test_services.dart';

class TestItem extends StatelessWidget{

  final String codigo;
  final int puntuacionDirecta;
  final int puntuacionDirectaSpan;
  final int puntuacionInverso;
  final int puntuacionInversoSpan;
  final int puntuacionCreciente;
  final int puntuacionCrecienteSpan;

  final QueryDocumentSnapshot _snapshot;

  TestItem(this._snapshot):
        codigo = _snapshot.get("COD") as String,
        puntuacionDirecta = _snapshot.get("Dd") as int,
        puntuacionDirectaSpan = _snapshot.get("SpanDd") as int,
        puntuacionInverso = _snapshot.get("Di") as int,
        puntuacionInversoSpan = _snapshot.get("SpanDi") as int,
        puntuacionCreciente = _snapshot.get("Dc") as int,
        puntuacionCrecienteSpan = _snapshot.get("SpanDc") as int;

  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text("$codigo"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Test $codigo"),
                        content: Container(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Puntuacion directa: $puntuacionDirecta"),
                              Text("Puntuacion inversa: $puntuacionInverso"),
                              Text("Puntuacion creciente: $puntuacionCreciente"),
                            ],
                          ),
                        ),
                      );
                    }
                );
              }, 
              icon: Icon(Icons.remove_red_eye_sharp)
          ),
          IconButton(
              onPressed: (){
                TestServices().deleteTest(codigo);
              }, 
              icon: Icon(Icons.delete)
          )
        ],
      ),
    );
  }
}