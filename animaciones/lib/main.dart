import 'package:animaciones/providers/contador_provider.dart';
import 'package:animaciones/widget/animated_container_widget.dart';
import 'package:animaciones/widget/increment_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animaciones Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => ContadorProvider(8),
        child: Scaffold(
          appBar: AppBar(
            title: Text("App animada"),
          ),
          body: const Center(
            child: AnimatedContainerWidget(),
          ),
          floatingActionButton: IncrementWidget()
        ),
      )
    );
  }
}

