import 'package:ecommerce_admin_app/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: Responsive.isDesktop(context) ? 30 : 50),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(Responsive.isDesktop(context) ? 15 : 20),
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(height: 10),
                Flexible(
                  child: Text(
                    "Get a 50% discount code by inviting your friends",
                    style: TextStyle(
                        color: Colors.white, height: 1.7, fontSize: 12),
                    softWrap: true,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -15,
            child: Container(
              // height: 20,
              // width: 50,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: const Text(
                "See More",
                style: TextStyle(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
