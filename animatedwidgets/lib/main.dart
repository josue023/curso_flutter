import 'package:animatedwidgets/widgets/rotatinglogo_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotating Logo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Logo rotante"),
        ),
        body: Center(
            child: SpinnerController()
        ),
      ),
    );
  }
}

class SpinnerController extends StatefulWidget{
  const SpinnerController();

  @override
  _SpinnerControllerState createState () => _SpinnerControllerState();
}

class _SpinnerControllerState extends State<SpinnerController> with TickerProviderStateMixin{
  late final AnimationController _controller;
  late final Animation<Color?> _tween;
  //late final CurvedAnimation _curved;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
        vsync: this,
      duration: Duration(seconds: 3)
    );
    /*_curved = CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceIn
    );*/
    _tween = ColorTween(
      begin: Colors.red,
      end: Colors.black
    ).animate(_controller);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: AnimatedBuilder(
        animation: _tween,
        builder: (context, child){
          return ElevatedButton(
              onPressed: onTapButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: _tween.value
              ),
              child: child
          );
        },
        child: Text("Change my color"),
      ),
    );
  }

  void onTapButton(){
    if(_controller.status != AnimationStatus.completed){
      _controller.forward();
    }else{
      _controller.reverse();
    }
  }
}