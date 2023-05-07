import 'package:ecommerce_admin_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/drawer.dart';
import '../dashboard/dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      drawerEnableOpenDragGesture: false,
      drawer: const DrawerWidget(),
      endDrawer: const Drawer(),
      body: Row(
        children: [
          Responsive.isDesktop(context)
              ? const Expanded(flex: 2, child: DrawerWidget())
              : Container(),
          Expanded(flex: 6, child: DashBoardScreen(scaffold: scaffoldKey)),
          Responsive.isTablet(context) || Responsive.isDesktop(context)
              ? Expanded(
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
                  ))
              : Container(),
        ],
      ),
    );
  }
}
