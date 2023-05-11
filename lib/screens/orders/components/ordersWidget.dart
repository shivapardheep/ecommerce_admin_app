import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../models/ordersModel.dart';
import '../../../responsive.dart';
import '../../../utils/functionalities/provider.dart';

class OrdersWidget extends StatefulWidget {
  final int limit;

  const OrdersWidget({super.key, required this.limit});

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  int selectedOrder = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: List.generate(
            widget.limit,
            (index) => OrdersCardWidget(
                  orderModel: ordersList[index],
                  index: index,
                  onTap: () {
                    setState(() {
                      selectedOrder = index;
                    });
                  },
                  selectedOrder: selectedOrder,
                )),
      ),
    );
  }
}

class OrdersCardWidget extends StatefulWidget {
  final OrderModel orderModel;
  final int index;
  final VoidCallback onTap;
  final int selectedOrder;

  const OrdersCardWidget(
      {super.key,
      required this.orderModel,
      required this.index,
      required this.onTap,
      required this.selectedOrder});

  @override
  State<OrdersCardWidget> createState() => _OrdersCardWidgetState();
}

class _OrdersCardWidgetState extends State<OrdersCardWidget> {
  @override
  Widget build(BuildContext context) {
    bool isTranslated =
        Provider.of<FunctionalitiesProvider>(context).getOrdersAnimation;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        transform: Matrix4.translationValues(
            isTranslated ? 0.0 : -((widget.index + 1) * 80.0), 0.0, 0.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: widget.selectedOrder == widget.index
                    ? null
                    : Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  widget.selectedOrder == widget.index
                      ? BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      : const BoxShadow(color: Colors.white),
                ],
                color:
                    widget.selectedOrder == widget.index ? Colors.white : null,
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
                          color: widget.selectedOrder == widget.index
                              ? primaryColor
                              : Colors.grey.shade100),
                      child: Center(
                          child: Text(
                        (widget.index + 1).toString(),
                        style: TextStyle(
                            color: widget.selectedOrder == widget.index
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 15),
                      )),
                    ),
                    Text(widget.orderModel.referenceId),
                    Text("${widget.orderModel.price} USD"),
                    Responsive.isMobile(context)
                        ? const Icon(Icons.verified, color: Colors.green)
                        : Text(widget.orderModel.status),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: widget.selectedOrder == widget.index
                              ? primaryColor
                              : Colors.grey,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
