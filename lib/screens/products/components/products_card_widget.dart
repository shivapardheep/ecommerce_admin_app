import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants/constants.dart';
import '../../../responsive.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({Key? key}) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //checkbox
          Checkbox(
            value: isChecked,
            onChanged: (newValue) {
              setState(() {
                isChecked = newValue!;
              });
            },
            checkColor: Colors.white,
            activeColor: primaryColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  4), // adjust the value to change the amount of rounding
              side: BorderSide(color: Colors.grey.shade100),
            ),
          ),
          //image
          Container(
            height: 70,
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/shirt.jpg"),
                    fit: BoxFit.cover)),
          ),
          //name & subName
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              height: 60,
              width:
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? 200
                      : 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Men's Blue Checkered Shirt",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "A stylish blue checkered shirt for men, made with high-quality cotton material.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          //category
          width > 840
              ? SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 25,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey.shade100),
                        child: const Center(
                          child: Text(
                            "men's clothing",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 25,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade100),
                        child: const Center(
                          child: Text(
                            "Shirt",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          //price
          !Responsive.isMobile(context)
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: 50,
                    child: Text("₹950",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                  ),
                )
              : Container(),
          //size
          Responsive.isDesktop(context)
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: 65,
                    child: Text("S, M, L, XL",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                  ),
                )
              : Container(),
          //product id
          const Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                width: 70,
                child: Text("UG54678",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          //star rating
          Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? SizedBox(
                  width: 130,
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: 3,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "3.0 ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "(7)",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              : Container(),
          //edit & more buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(6),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    child: Ink(
                      height: 25,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: darkBlue,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.edit, size: 15, color: Colors.white),
                          SizedBox(width: 6),
                          Text('Edit',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
                Responsive.isMobile(context)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Material(
                          borderRadius: BorderRadius.circular(7),
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(7),
                            child: Ink(
                              height: 35,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.grey.shade100),
                              child: const Center(
                                child: Icon(
                                  Icons.more_vert,
                                  size: 18,
                                  weight: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            child: Ink(
                              height: 25,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade100),
                              child: const Center(
                                child: Icon(
                                  Icons.more_horiz,
                                  size: 18,
                                  weight: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          //more option
        ],
      ),
    );
  }
}
