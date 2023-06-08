import 'package:flutter/cupertino.dart';
import '../models/items.dart';

class SuccessItemWidget extends StatelessWidget{
  final Item? item;
  const SuccessItemWidget(this.item);

  @override
  Widget build(BuildContext context){
    if(item != null){
      return Text("${item!.id} - ${item!.title}");
    }else{
      return Text("No data to show");
    }
  }
}