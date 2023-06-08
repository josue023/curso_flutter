import 'package:descargas/provider/progress.dart';
import 'package:descargas/widgets/download_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DownloadProgres>(
        create: (_) => DownloadProgres(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Desacargar Pdf"),
          ),
          body: Center(
            child: const DownloadWidget(),
          ),
        )
      ),

    );
  }
}

