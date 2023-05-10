import 'package:ecommerce_admin_app/constants/constants.dart';
import 'package:ecommerce_admin_app/utils/functionalities/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../responsive.dart';
import '../../widgets/header.dart';
import 'components/intro_card.dart';
import 'components/recent_orders.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<IconsModel> iconsList = [
    IconsModel("assets/icons/products.png", "Products", "1250"),
    IconsModel("assets/icons/earning1.png", "Earnings", "\$ 34,567.00"),
    IconsModel("assets/icons/orders_new.png", "Orders", "45,321"),
    IconsModel("assets/icons/customer1.png", "Customers", "23,430"),
  ];
  void _openDrawer() {
    homeScreenScaffold.currentState!.openDrawer();
  }

  @override
  void initState() {
    super.initState();
    context.read<FunctionalitiesProvider>().dashBoardAnimationFun();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Responsive.isDesktop(context) ? 20 : 0),
            bottomLeft: Radius.circular(Responsive.isDesktop(context) ? 20 : 0),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
            IntroCards(iconsList: iconsList),
            SizedBox(height: height * 0.03),
            const RecentOrderTitle(),
            const RecentOrdersWidget(limit: 5),
          ],
        ),
      ),
    );
  }
}

class IconsModel {
  final String image;
  final String title;
  final String value;

  IconsModel(this.image, this.title, this.value);
}
