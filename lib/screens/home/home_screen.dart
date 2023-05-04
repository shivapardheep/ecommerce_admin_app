import 'package:ecommerce_admin_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: const DrawerWidget(),
      appBar: !Responsive.isDesktop(context) ? AppBar() : null,
      body: Row(
        children: [
          Responsive.isDesktop(context)
              ? const Expanded(flex: 2, child: DrawerWidget())
              : Container(),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(width.toString()),
                  ),
                ),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        "Messages",
                        style: GoogleFonts.lato().copyWith(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class IconsModel {
  final Widget defaultIcon;
  final Widget selectedIcon;
  final Color defaultColor;
  final Color selectedColor;
  final String title;

  IconsModel(
      {required this.defaultIcon,
      required this.selectedIcon,
      required this.defaultColor,
      required this.selectedColor,
      required this.title});
}
