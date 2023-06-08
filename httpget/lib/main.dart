import 'package:flutter/material.dart';
import 'package:httpget/helpers/item_request.dart';
import 'package:httpget/widgets/request_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  final req = const RequestItem(url: "https://jsonplaceholder.typicode.com/posts/10");

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HTTP get request"),
        ),
        body: Center(
          child: HTTPWidget(req),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
