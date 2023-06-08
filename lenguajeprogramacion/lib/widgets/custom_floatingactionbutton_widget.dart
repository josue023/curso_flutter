import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget{

  CustomFloatingActionButton();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Añadir lenguaje"),
                  content: TextField(
                    controller: _controller,
                  ),
                  actions: [
                    TextButton(
                        child: Text("Crear"),
                        onPressed: () async {
                          final nombre = _controller.text;
                          FirebaseFirestore
                              .instance
                              .collection("lenguajes")
                              .add({
                                "imagen" : "dart.png",
                                "votos" : 5,
                                "nombre" : nombre
                              });
                          Navigator.of(context).pop();
                        },
                    )
                  ],
                );
              }
          );
        },
    );
  }
}