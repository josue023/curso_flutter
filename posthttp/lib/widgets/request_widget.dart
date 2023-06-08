import 'package:flutter/material.dart';
import 'package:httpget/helpers/base_request.dart';
import 'package:httpget/widgets/error_widget.dart';
import 'package:httpget/widgets/success.dart';
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
            return ErrorItemWidget();
          }

          if(snapshot.hasData){
            return SuccessItemWidget(snapshot.data);
          }
          return CircularProgressIndicator();
        }
    );
  }
}

