import 'package:ecommerce_admin_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/functionalities/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List iconsList = [
    IconsModel(
        defaultIcon: const Icon(Icons.dashboard_outlined,
            color: Colors.black87, size: 20),
        selectedIcon:
            const Icon(Icons.dashboard, color: Colors.white, size: 20),
        defaultColor: Colors.black87,
        selectedColor: Colors.white,
        title: "Dashboard"),
    IconsModel(
        defaultIcon:
            const Icon(Icons.attach_money, color: Colors.black87, size: 20),
        selectedIcon:
            const Icon(Icons.attach_money, color: Colors.white, size: 20),
        defaultColor: Colors.black87,
        selectedColor: Colors.white,
        title: "Transaction"),
    IconsModel(
        defaultIcon: const Icon(Icons.shopping_cart_outlined,
            color: Colors.black87, size: 20),
        selectedIcon: const Icon(Icons.shopping_cart_sharp,
            color: Colors.white, size: 20),
        defaultColor: Colors.black87,
        selectedColor: Colors.white,
        title: "Orders"),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        appName,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Image.asset(
                        "assets/images/logo_only.png",
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.05),
                  Expanded(
                    child: ListView.builder(
                        itemCount: iconsList.length,
                        itemBuilder: (context, i) {
                          return TileWidgets(
                              iconsModel: iconsList[i], index: i);
                        }),
                  ),
                ],
              )),
          Expanded(
              flex: 6,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(width.toString()),
                ),
              )),
          Expanded(flex: 3, child: Container(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}

class TileWidgets extends StatelessWidget {
  final IconsModel iconsModel;
  final int index;

  const TileWidgets({super.key, required this.iconsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        Provider.of<FunctionalitiesProvider>(context).getCurrentPageIndex;

    bool isActive = index == selectedIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          context.read<FunctionalitiesProvider>().changePageIndex(index);
        },
        child: Center(
          child: FittedBox(
            child: Container(
              height: 40,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isActive ? Colors.black : null,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Row(
                  mainAxisAlignment: isActive
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    isActive ? iconsModel.selectedIcon : iconsModel.defaultIcon,
                    const SizedBox(width: 10),
                    Text(iconsModel.title,
                        style: TextStyle(
                            color: isActive
                                ? iconsModel.selectedColor
                                : iconsModel.defaultColor)),
                  ],
                ),
              ),
            ),
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       isActive ? iconsModel.selectedIcon : iconsModel.defaultIcon,
        //       const SizedBox(width: 10),
        //       Text(iconsModel.title,
        //           style: TextStyle(
        //               color: isActive
        //                   ? iconsModel.selectedColor
        //                   : iconsModel.defaultColor)),
        //     ],
        //   ),
        // ),
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
