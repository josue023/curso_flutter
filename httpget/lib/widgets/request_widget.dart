import 'package:flutter/material.dart';
import 'package:httpget/helpers/base_request.dart';
import '../models/items.dart';

class HTTPWidget extends StatefulWidget{

  final HTTPResquest<Item> _resquest;
  const HTTPWidget(this._resquest, {super.key});


  @override
  State<HTTPWidget> createState() => _HTTPWidgetState();

}

class _HTTPWidgetState extends State<HTTPWidget>{
  late final Future<Item> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = widget._resquest.execute();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: futureItem,
        builder: (BuildContext context, AsyncSnapshot<Item> snapshot){
          if(snapshot.hasError){
            return Text("Error en los datoss");
          }

          if(snapshot.hasData){
            Item? item = snapshot.data;
            if(item != null){
              return Text("${item.id} - ${item.title}");
            }else{
              return Text("No data to show");
            }
          }
          return CircularProgressIndicator();
        }
    );
  }
}

