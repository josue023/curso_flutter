import 'package:flutter/material.dart';
//import 'dart:math' as math;

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
        duration: Duration(seconds: 10)
    );
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
      body: Center(
        child: Hero(
            tag: "Flutter Logo",
            child: GestureDetector(
              child: const FlutterLogo(
                size: 100,
              ),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context){
                        return Container(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: GestureDetector(
                              child: FlutterLogo(
                                size: 200,
                              ),
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        );
                      }
                  )
                );
              },
            )
        ),
      )
    );
  }

}
