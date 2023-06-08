
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class DownloadProgres with ChangeNotifier{
  double _progres = 0;

  double get progres => _progres;


  void start({required String url, required String filenamePath}) async{
    _reset();

    final directories = await getExternalStorageDirectory();
    final finalPath = directories!.path + "/" + filenamePath;

    print(finalPath);

    //Download
    await Dio().download(url, finalPath,
      options: Options(
        headers: {
          HttpHeaders.acceptEncodingHeader: "*"
        }
      ),
      onReceiveProgress: (received, total){
        if(total != -1){
          var pos = received / total * 100;
          //actualizar porcentaje
          _updateProgress(pos);
        }
      }
    );
  }

  void _updateProgress(double valor){
    _progres = valor;
    notifyListeners();
  }

  void _reset(){
    if(progres != 0){
      _progres = 0;
      notifyListeners();
    }
  }
}