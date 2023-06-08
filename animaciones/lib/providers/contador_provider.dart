import 'package:flutter/cupertino.dart';

class ContadorProvider with ChangeNotifier{
  double _counter;

  double get counter => _counter;

  set counter(double value) {
    _counter = value;
  }

  ContadorProvider(this._counter);

  void increment(){
    _counter = counter + 1;
    notifyListeners();
  }
}