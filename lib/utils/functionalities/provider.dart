import 'package:flutter/material.dart';

class FunctionalitiesProvider extends ChangeNotifier {
  int _currentPageIndex = 2;
  int get getCurrentPageIndex => _currentPageIndex;
  //
  bool _dashBoardAnimation = false;
  bool get getDashBoardAnimation => _dashBoardAnimation;
  //
  bool _ordersAnimation = false;
  bool get getOrdersAnimation => _ordersAnimation;

  changePageIndex(index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  dashBoardAnimationFun() async {
    await Future.delayed(const Duration(seconds: 1));
    _dashBoardAnimation = true;
    notifyListeners();
  }

  ordersAnimationFun() async {
    await Future.delayed(const Duration(seconds: 1));
    _ordersAnimation = true;
    notifyListeners();
  }
}
