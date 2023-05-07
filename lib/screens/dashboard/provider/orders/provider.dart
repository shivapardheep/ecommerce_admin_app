import 'package:flutter/material.dart';

class LatestOrdersProvider extends ChangeNotifier {
  int _selectedOrder = 0;
  int get getSelectedOrder => _selectedOrder;

  changeOrder(int index) {
    _selectedOrder = index;
    notifyListeners();
  }
}
