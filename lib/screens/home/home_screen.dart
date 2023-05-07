import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_admin_app/constants.dart';
import 'package:ecommerce_admin_app/responsive.dart';
import 'package:ecommerce_admin_app/widgets/atm_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  List<Users> usersList = [
    Users("assets/images/user1.jpg", "sheela Tani", "sheela1@gmail.com"),
    Users("assets/images/user2.jpg", "Handro Horn", "handro23@gmail.com"),
    Users("assets/images/user3.jpg", "Mansi moro", "mansi66@gmail.com"),
    Users("assets/images/user4.jpg", "Danor drano", "danor34@gmail.com"),
    Users("assets/images/user5.jpg", "Paksilan parten", "paksilan45@gmail.com"),
  ];

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
                  flex: Responsive.isTablet(context) ? 3 : 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(
                      height: height,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.05),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                "Messages",
                                style: GoogleFonts.lato().copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            ...List.generate(usersList.length,
                                (i) => MessageCard(users: usersList[i])),
                            SizedBox(height: height * 0.02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                "Carts",
                                style: GoogleFonts.lato().copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(height: height * 0.025),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Material(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(10),
                                  child: DottedBorder(
                                      color: Colors.grey,
                                      strokeWidth: 1,
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(10),
                                      dashPattern: const [6, 3],
                                      child: SizedBox(
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            FaIcon(FontAwesomeIcons.squarePlus,
                                                color: primaryColor),
                                            SizedBox(width: 10),
                                            Text(
                                              "Add to carts",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.025),
                            const CreditCardsPage(),
                          ],
                        ),
                      ),
                    ),
                  ))
              : Container(),
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final Users users;

  const MessageCard({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
      child: Material(
        child: InkWell(
          onTap: () {},
          hoverColor: Colors.grey.shade100,
          splashColor: Colors.grey,
          child: Ink(
            color: Colors.white,
            height: 40,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(users.image),
                  backgroundColor: primaryColor,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        users.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        users.email,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 9,
                            color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10),
    //   child: SizedBox(
    //     height: 20,
    //     child: ListTile(
    //       horizontalTitleGap: 5,
    //       onTap: () {},
    //       leading: Container(
    //         height: 30,
    //         width: 30,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(30),
    //             image: DecorationImage(
    //                 image: AssetImage(users.image), fit: BoxFit.cover)),
    //       ),
    //       title: Text(
    //         users.name,
    //         style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    //       ),
    //       subtitle: Text(
    //         users.email,
    //         style: const TextStyle(fontSize: 10),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class Users {
  final String image;
  final String name;
  final String email;

  Users(this.image, this.name, this.email);
}
