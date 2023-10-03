import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int _counter = 0;
  String _primo = "primo";
  Color _color = Colors.green;

  int get counter => _counter; 
  String get primo => _primo;
  Color get color => _color;

  void incrementCounter() {
      _counter++;
      notifyListeners(); 
  }

  void decrementCounter() {
      _counter--;
      notifyListeners(); 
  }

  void resetCounter(){
    _counter = 0;
    notifyListeners();
  }

  void xDos(){
    _counter = _counter * 2;
    notifyListeners();
  }
  void xTres(){
    _counter = _counter * 3;
    notifyListeners();
  }
  void xCinco(){
    _counter = _counter * 5;
    notifyListeners();
  }

  void showSnackBar(context, text){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      )
    );
  }

  void esPrimo(){
    if(_counter % 2 == 0){
      _primo = "Numero NO primo";
      _color = Colors.blue;
    }else{
      _primo = "Numero Primo";
      _color = Colors.green;
    }
  }

}