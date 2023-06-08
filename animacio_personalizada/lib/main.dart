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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
  with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 15)
    )..repeat();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child){
            //final scale = 1 - (_controller.value*0.5);
            //final pos = 20 + (_controller.value*400);
            return /*Stack(
              children: [
                Transform(
                    transform: Matrix4.identity()
                        ..scale(scale)
                        ..translate(pos, pos),
                  child: child,
                ),
                const Text("ME vez?")
              ],
            );*/
            Transform(
                transform: Matrix4.skewY(0.1)
                    ..rotateY(_controller.value*2*math.pi),
              child: child,
            );
          },
          /*child: ElevatedButton(
            child: Text("Muevete!"),
            onPressed: _moveMe,
          ),*/
          child: Center(
            child: Container(
              width: 120,
              height: 60,
              color: Colors.cyan,
              child: const Text("Giro!", textAlign: TextAlign.center,),
            ),
          ),
        ),
    );
  }

  /*void _moveMe(){
    if(_controller.status == AnimationStatus.completed){
      _controller.reverse();
    }else{
      _controller.forward();
    }
  }*/
}
