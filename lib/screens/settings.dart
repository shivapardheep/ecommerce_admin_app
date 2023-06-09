import 'package:ecommerce_admin_app/constants/constants.dart';
import 'package:ecommerce_admin_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../responsive.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _openDrawer() {
    homeScreenScaffold.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Colors.white,
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
          Center(
            child: Lottie.asset("assets/lottie/working-in-progress.json",
                repeat: true, height: height / 1.5),
          ),
        ],
      ),
    );
  }
}
