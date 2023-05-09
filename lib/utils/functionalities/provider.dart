import 'package:flutter/material.dart';

class FunctionalitiesProvider extends ChangeNotifier {
  int _currentPageIndex = 0;
  int get getCurrentPageIndex => _currentPageIndex;
  //
  bool _introCardAnimation = false;
  bool get getIntroCardAnimation => _introCardAnimation;
  //
  bool _recentOrderAnimation = false;
  bool get getRecentOrderAnimation => _recentOrderAnimation;
  //
  bool _messageCardAnimation = false;
  bool get getMessageCardAnimation => _messageCardAnimation;
  //
  bool _creditCardAnimation = false;
  bool get getCreditCardAnimation => _creditCardAnimation;

  changePageIndex(index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  dashBoardAnimationFun() async {
    await Future.delayed(const Duration(seconds: 1));
    _introCardAnimation = true;
    _recentOrderAnimation = true;
    _messageCardAnimation = true;
    _creditCardAnimation = true;
    notifyListeners();
  }

  disposeDashboardAnimation() {
    _introCardAnimation = false;
    _recentOrderAnimation = false;
    notifyListeners();
  }
}
