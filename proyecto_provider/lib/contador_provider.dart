import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier{
  int _counter;

  ContadorProvider(this._counter);

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  void increment(){
    _counter++;
    notifyListeners();
  }

  void decrement(){
    if(_counter > 0){
      _counter--;
    }

    notifyListeners();
  }

}