import 'package:ecommerce_admin_app/constants/constants.dart';
import 'package:ecommerce_admin_app/screens/orders/components/ordersWidget.dart';
import 'package:ecommerce_admin_app/utils/functionalities/provider.dart';
import 'package:ecommerce_admin_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  void _openDrawer() {
    homeScreenScaffold.currentState!.openDrawer();
  }

  @override
  void initState() {
    super.initState();
    context.read<FunctionalitiesProvider>().ordersAnimationFun();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Responsive.isDesktop(context) ? 20 : 0),
          bottomLeft: Radius.circular(Responsive.isDesktop(context) ? 20 : 0),
        ),
        color: bgColor2,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !Responsive.isDesktop(context)
                ? IconButton(
                    onPressed: () => _openDrawer(),
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ))
                : Container(),
            const HeaderWidget(),
            OrdersWidget(limit: ordersList.length),
          ],
        ),
      ),
    );
  }
}
