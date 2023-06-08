import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotatingLogo extends StatelessWidget{
  final Animation<double> controller;
  const RotatingLogo({
    required  Animation<double> this.controller
  });

  //static const _fullRotation = 2 * math.pi;

  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child){
        return Transform.rotate(
          angle: controller.value,
          child: child,
        );
      },
      child: const FlutterLogo(
        size: 50,
      ),
    );
  }
}