import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../widgets/header.dart';
import 'components/intro_card.dart';
import 'components/recent_orders.dart';

class DashBoardScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;

  const DashBoardScreen({super.key, required this.scaffold});
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
        price: "5.00",
        status: "Payment successful",
        referenceId: "REF-36987452"),
    OrderModel(
        price: "200.00",
        status: "Payment successful",
        referenceId: "REF-12546987"),
  ];
  void _openDrawer() {
    widget.scaffold.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Container(
        color: Colors.white,
        height: height,
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
              HeaderWidget(height: height, scaffold: widget.scaffold),
              IntroCards(iconsList: iconsList),
              SizedBox(height: height * 0.03),
              const RecentOrderTitle(),
              RecentOrdersWidget(ordersList: ordersList),
            ],
          ),
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

class OrderModel {
  final String price;
  final String status;
  final String referenceId;

  OrderModel(
      {required this.price, required this.status, required this.referenceId});
}
