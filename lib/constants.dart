import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';

const String appName = "Shiva Shoppi";
const Color darkBlue = Color(0xff010b1c);

List iconsList = [
  IconsModel(
      defaultIcon:
          const Icon(Icons.dashboard_outlined, color: Colors.black87, size: 20),
      selectedIcon: const Icon(Icons.dashboard, color: Colors.white, size: 20),
      defaultColor: Colors.black87,
      selectedColor: Colors.white,
      title: "Dashboard"),
  IconsModel(
      defaultIcon: const Icon(Icons.account_balance_wallet_outlined,
          color: Colors.black87, size: 20),
      selectedIcon: const Icon(Icons.account_balance_wallet_sharp,
          color: Colors.white, size: 20),
      defaultColor: Colors.black87,
      selectedColor: Colors.white,
      title: "Transaction"),
  IconsModel(
      defaultIcon:
          const Icon(Icons.receipt_outlined, color: Colors.black87, size: 20),
      selectedIcon:
          const Icon(Icons.receipt_sharp, color: Colors.white, size: 20),
      defaultColor: Colors.black87,
      selectedColor: Colors.white,
      title: "Orders"),
  IconsModel(
      defaultIcon: const Icon(Icons.shopping_basket_outlined,
          color: Colors.black87, size: 20),
      selectedIcon: const Icon(Icons.shopping_basket_sharp,
          color: Colors.white, size: 20),
      defaultColor: Colors.black87,
      selectedColor: Colors.white,
      title: "Products"),
  IconsModel(
      defaultIcon:
          const Icon(Icons.message_outlined, color: Colors.black87, size: 20),
      selectedIcon:
          const Icon(Icons.message_sharp, color: Colors.white, size: 20),
      defaultColor: Colors.black87,
      selectedColor: Colors.white,
      title: "Messages"),
  IconsModel(
      defaultIcon:
          const Icon(Icons.settings_outlined, color: Colors.black87, size: 20),
      selectedIcon:
          const Icon(Icons.settings_sharp, color: Colors.white, size: 20),
      defaultColor: Colors.black87,
      selectedColor: Colors.white,
      title: "Settings"),
  IconsModel(
      defaultIcon:
          const Icon(Icons.logout_outlined, color: Colors.black87, size: 20),
      selectedIcon:
          const Icon(Icons.logout_sharp, color: Colors.white, size: 20),
      defaultColor: Colors.black87,
      selectedColor: Colors.white,
      title: "Logout"),
];
