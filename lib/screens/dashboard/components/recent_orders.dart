import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../dashboard.dart';
import '../provider/orders/provider.dart';

class RecentOrderTitle extends StatelessWidget {
  const RecentOrderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Latest Orders",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () {},
              child:
                  const Text("See all", style: TextStyle(color: Colors.blue))),
        ],
      ),
    );
  }
}

class RecentOrdersWidget extends StatelessWidget {
  const RecentOrdersWidget({
    super.key,
    required this.ordersList,
  });

  final List<OrderModel> ordersList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: List.generate(
            5,
            (index) => OrderCardWidget(
                orderModel: ordersList[index], index: index, onTap: () {})),
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
    int selectedOrder =
        Provider.of<LatestOrdersProvider>(context).getSelectedOrder;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Provider.of<LatestOrdersProvider>(context, listen: false)
                .changeOrder(index);
          },
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
