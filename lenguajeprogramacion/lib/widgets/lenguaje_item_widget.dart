import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LenguajeItem extends StatelessWidget{
   final String nombre;
   final int votos;
   final String imagen;
   final QueryDocumentSnapshot _snapshot;

   LenguajeItem(this._snapshot):
          nombre = _snapshot.get("nombre") as String,
          votos = _snapshot.get("votos") as int,
          imagen = _snapshot.get("imagen") as String;

   @override
   Widget build(BuildContext context){
      return ListTile(
         leading: Image.asset("assets/images/$imagen"),
         title: Text("$nombre"),
         subtitle: Text("El numero de votos es: $votos"),
         trailing: Row(
           mainAxisSize: MainAxisSize.min,
           children: [
             IconButton(
                 onPressed: _addVoto,
                 icon: Icon(Icons.thumb_up),
                color: Colors.lightBlue,
                iconSize: 20,
             ),

             IconButton(
                 icon: Icon(Icons.delete),
               color: Colors.red,
               iconSize: 20,
               onPressed: (){
                   showDialog(
                       context: context,
                       builder: (BuildContext context){
                         return AlertDialog(
                           title: Text("De verdad quieres borrar $nombre"),
                           actions: [
                             TextButton(
                                 onPressed: (){
                                   Navigator.of(context).pop();
                                 },
                                 child: Text("Cancelar")
                             ),
                             TextButton(
                                 onPressed: (){
                                   _rmvLenguaje();
                                   Navigator.of(context).pop();
                                 },
                                 child: Container(
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Text("Borrar", style: TextStyle(color: Colors.white),),
                                   ),
                                   color: Colors.red,
                                 )
                             )
                           ],
                         );
                       }
                   );
               },
             )
           ],
         ),
      );
   }

   void _addVoto(){
      FirebaseFirestore
          .instance.runTransaction((transaction) async{
             final secureSnapshot = await transaction.get(_snapshot.reference);
             final currentVotos = secureSnapshot.get("votos") as int;

             transaction.update(secureSnapshot.reference, {
                "votos":currentVotos + 1
             });
      });
   }

   void _rmvLenguaje(){
     FirebaseFirestore
         .instance.collection("lenguajes")
         .doc(_snapshot.id)
         .delete();
   }
}