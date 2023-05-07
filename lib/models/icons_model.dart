import 'package:flutter/material.dart';

class IconsModel {
  final Widget defaultIcon;
  final Widget selectedIcon;
  final Color defaultColor;
  final Color selectedColor;
  final String title;

  IconsModel(
      {required this.defaultIcon,
      required this.selectedIcon,
      required this.defaultColor,
      required this.selectedColor,
      required this.title});
}
