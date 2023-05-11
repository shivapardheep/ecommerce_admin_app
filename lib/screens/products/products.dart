import 'package:ecommerce_admin_app/constants/constants.dart';
import 'package:ecommerce_admin_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../responsive.dart';
import 'components/products_card_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _openDrawer() {
    homeScreenScaffold.currentState!.openDrawer();
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Responsive.isDesktop(context) ? 20 : 0),
          bottomLeft: Radius.circular(Responsive.isDesktop(context) ? 20 : 0),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     offset: const Offset(0, 1),
        //     blurRadius: 1,
        //     spreadRadius: 1,
        //   ),
        // ],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text("Products",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  !Responsive.isMobile(context)
                      ? SizedBox(
                          height: 30,
                          width: 130,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: darkBlue),
                              onPressed: () {},
                              icon: const Icon(Icons.add_box,
                                  color: Colors.white, size: 17),
                              label: const Text("NEW PRODUCT",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500))),
                        )
                      : IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_box, color: darkBlue)),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 27,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sort by",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(width: 10),
                              FaIcon(FontAwesomeIcons.chevronDown,
                                  color: Colors.grey[700], size: 13),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 27,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Price Range",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(width: 10),
                              FaIcon(FontAwesomeIcons.sliders,
                                  color: Colors.grey[700], size: 12),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(10, (index) => const ProductCardWidget()),
            Center(child: Text(width.toString())),
          ],
        ),
      ),
    );
  }
}
