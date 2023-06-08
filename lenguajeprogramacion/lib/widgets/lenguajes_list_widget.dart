import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lenguajeprogramacion/widgets/connection_error_widget.dart';
import 'package:lenguajeprogramacion/widgets/lenguaje_item_widget.dart';

class LenguajeListWidget extends StatelessWidget{

  static Stream<QuerySnapshot> getStream() =>
      FirebaseFirestore
          .instance
          .collection("lenguajes")
          .orderBy("votos", descending: true)
          .snapshots();


  const LenguajeListWidget();

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
        stream: getStream(),
        builder: (context, lenguajes){
          if(lenguajes.hasError){
            return ConnectionError();
          }

          if(lenguajes.hasData){
            final data = lenguajes.data;

            if(data != null){
              return ListView.builder(
                itemExtent: 80,
                  itemCount: data.docs.length,
                  itemBuilder: (context, index){
                    return LenguajeItem(data.docs[index]);
                  }
              );
            }
          }

          return CircularProgressIndicator();
        }
    );
  }
}

