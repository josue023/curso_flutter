import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/contador_provider.dart';

class IncrementWidget extends StatelessWidget{
  const IncrementWidget();

  @override
  Widget build(BuildContext context){
    return Consumer<ContadorProvider>(
      builder: (context, status, _){
        return FloatingActionButton(
          child: Icon(Icons.add),
            onPressed: (){
              status.increment();
            }
        );
      },
    );
  }
}