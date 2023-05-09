import 'package:flutter/material.dart';

import 'models/icons_model.dart';
import 'models/ordersModel.dart';

const String appName = "Shiva Shoppi";
const Color darkBlue = Color(0xff010b1c);
const Color primaryColor = Colors.deepOrange;
GlobalKey<ScaffoldState> homeScreenScaffold = GlobalKey<ScaffoldState>();

List<OrderModel> ordersList = [
  OrderModel(
      price: "50.00",
      status: "Payment successful",
      referenceId: "REF-15453243"),
  OrderModel(
      price: "20.00",
      status: "Payment successful",
      referenceId: "REF-25463289"),
  OrderModel(
      price: "75.00",
      status: "Payment successful",
      referenceId: "REF-98654721"),
  OrderModel(
      price: "10.00",
      status: "Payment successful",
      referenceId: "REF-36521478"),
  OrderModel(
      price: "100.00",
      status: "Payment successful",
      referenceId: "REF-75219863"),
  OrderModel(
      price: "30.00",
      status: "Payment successful",
      referenceId: "REF-63254879"),
  OrderModel(
      price: "60.00",
      status: "Payment successful",
      referenceId: "REF-87951236"),
  OrderModel(
      price: "90.00",
      status: "Payment successful",
      referenceId: "REF-98765432"),
  OrderModel(
      price: "5.00", status: "Payment successful", referenceId: "REF-36987452"),
  OrderModel(
      price: "200.00",
      status: "Payment successful",
      referenceId: "REF-12546987"),
];

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
