import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier{

  int _currentScreenIndex = 0;
  int get currentIndex => _currentScreenIndex;

  void updateIndex(int newIndex) {
    _currentScreenIndex = newIndex;
    notifyListeners();
  }


}
