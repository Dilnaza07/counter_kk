import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 50;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
