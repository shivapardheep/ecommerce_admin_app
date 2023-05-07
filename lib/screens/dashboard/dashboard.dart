import 'package:ecommerce_admin_app/constants.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../widgets/header.dart';
import 'components/intro_card.dart';

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
              HeaderWidget(height: height, scaffold: widget.scaffold),
              IntroCards(iconsList: iconsList),
              SizedBox(height: height * 0.03),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Latest Orders",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {},
                        child: const Text("See all",
                            style: TextStyle(color: Colors.blue))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: List.generate(
                      ordersList.length,
                      (index) => OrderCardWidget(
                          orderModel: ordersList[index],
                          index: index,
                          onTap: () {})),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCardWidget extends StatelessWidget {
  final OrderModel orderModel;
  final int index;
  final VoidCallback onTap;

  const OrderCardWidget(
      {super.key,
      required this.orderModel,
      required this.index,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    int selectedOrder = 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: selectedOrder == index
                  ? null
                  : Border.all(color: Colors.grey.shade200),
              boxShadow: [
                selectedOrder == index
                    ? BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      )
                    : const BoxShadow(color: Colors.white),
              ],
              color: selectedOrder == index ? Colors.white : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: selectedOrder == index
                            ? primaryColor
                            : Colors.grey.shade100),
                    child: Center(
                        child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          color: selectedOrder == index
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 15),
                    )),
                  ),
                  Text(orderModel.referenceId),
                  Text("${orderModel.price} USD"),
                  Responsive.isMobile(context)
                      ? const Icon(Icons.verified, color: Colors.green)
                      : Text(orderModel.status),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color:
                            selectedOrder == index ? primaryColor : Colors.grey,
                      ))
                ],
              ),
            ),
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
