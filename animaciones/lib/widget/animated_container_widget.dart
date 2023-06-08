import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/contador_provider.dart';

class AnimatedContainerWidget extends StatelessWidget{
  const AnimatedContainerWidget();

  @override
  Widget build(BuildContext context){
    return Consumer<ContadorProvider>(
      builder: (context, status, _){
        return AnimatedContainer(
          height: 200,
          width: 200,
          color:
            status.counter % 2 == 0
            ? Colors.lightBlue
            : Colors.lime,
          alignment: Alignment.center,
          duration: Duration(seconds: 4),
          curve: Curves.easeInOut,
          child: AnimatedAlign(
            alignment: status.counter % 2 == 0
              ? Alignment.topCenter
              : Alignment.bottomCenter,
            duration: Duration(seconds: 2),
            child: Container(
              height: 80,
              width: 80,
              color: Colors.red,
              child: AnimatedDefaultTextStyle(
                textAlign: TextAlign.center,
                duration: Duration(seconds: 4),
                style: TextStyle(
                  color: status.counter % 2 == 0
                    ? Colors.white
                    : Colors.lightBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hola 1"),
                    Text("Hola 2")
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
