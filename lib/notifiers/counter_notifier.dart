import 'package:flutter/cupertino.dart';

class CounterNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void incrementValue() {
    _value++;
    notifyListeners();
  }
}