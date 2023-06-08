import 'dart:async';

import 'package:async/async.dart';

class ControlContador {
  final _streamControl = StreamController<int>();

  int _contador = 0;

  Sink<int> get sink => _streamControl.sink;
  Stream<int> get stream => _streamControl.stream;

  void increment(){
    sink.add(++_contador);
  }

  dispose() => _streamControl.close();
}