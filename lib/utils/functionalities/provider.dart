import 'package:flutter/material.dart';

class FunctionalitiesProvider extends ChangeNotifier {
  int _currentPageIndex = 0;
  int get getCurrentPageIndex => _currentPageIndex;

  changePageIndex(index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
