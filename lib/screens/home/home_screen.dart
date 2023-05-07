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
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.05),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Messages",
                              style: GoogleFonts.lato().copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                          ...List.generate(usersList.length,
                              (i) => MessageCard(users: usersList[i])),
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

class MessageCard extends StatelessWidget {
  final Users users;

  const MessageCard({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      onTap: () {},
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: AssetImage(users.image), fit: BoxFit.cover)),
      ),
      title: Text(
        users.name,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        users.email,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}

class Users {
  final String image;
  final String name;
  final String email;

  Users(this.image, this.name, this.email);
}
