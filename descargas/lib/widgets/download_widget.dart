import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/progress.dart';

class DownloadWidget extends StatelessWidget{
  final String url = "http://descargas.pntic.mec.es/mentor/visitas/Creacion_y_produccion_musical.pdf";
  const DownloadWidget();

  @override
  Widget build (BuildContext context){
    return Center(
      child: Consumer<DownloadProgres>(
        builder: (context, status, _){
          var progress = status.progres.toStringAsFixed(2);

          return ElevatedButton(
              onPressed: () => status.start(url: url, filenamePath: "musica.pdf"),
              child: Text("$progress %")
          );
        },
      ),
    );
  }
}