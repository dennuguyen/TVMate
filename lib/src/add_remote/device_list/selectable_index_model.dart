import 'package:flutter/material.dart';

class SelectableIndexModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get index => _selectedIndex;

  void set(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
