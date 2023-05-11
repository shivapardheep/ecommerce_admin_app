import 'package:ecommerce_admin_app/constants/constants.dart';
import 'package:ecommerce_admin_app/responsive.dart';
import 'package:ecommerce_admin_app/screens/message.dart';
import 'package:ecommerce_admin_app/screens/orders/orders.dart';
import 'package:ecommerce_admin_app/screens/products/products.dart';
import 'package:ecommerce_admin_app/screens/settings.dart';
import 'package:ecommerce_admin_app/screens/transaction.dart';
import 'package:ecommerce_admin_app/utils/functionalities/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer.dart';
import '../dashboard/dashboard.dart';
import '../third-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [
    const DashBoardScreen(),
    const TransactionScreen(),
    const OrdersScreen(),
    const ProductsScreen(),
    const MessagesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    int currentIndex =
        Provider.of<FunctionalitiesProvider>(context).getCurrentPageIndex;
    return Scaffold(
      key: homeScreenScaffold,
      backgroundColor: bgColor,
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerWidget(),
      endDrawer: const Drawer(),
      body: Row(
        children: [
          Responsive.isDesktop(context) ? const DrawerWidget() : Container(),
          Expanded(
              flex: currentIndex == 0 ? 7 : 9, child: screens[currentIndex]),
          (Responsive.isTablet(context) || Responsive.isDesktop(context)) &&
                  currentIndex == 0
              ? Expanded(
                  flex: Responsive.isTablet(context) ? 3 : 2,
                  child: const ThirdScreen())
              : Container(),
        ],
      ),
    );
  }
}
