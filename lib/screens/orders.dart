import 'package:ecommerce_admin_app/constants/constants.dart';
import 'package:ecommerce_admin_app/screens/dashboard/components/recent_orders.dart';
import 'package:ecommerce_admin_app/widgets/header.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

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
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Colors.white,
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
            RecentOrdersWidget(limit: ordersList.length),
            // Center(
            //   child: Lottie.asset("assets/lottie/working-in-progress.json",
            //       repeat: true, height: height / 1.5),
            // ),
          ],
        ),
      ),
    );
  }
}
