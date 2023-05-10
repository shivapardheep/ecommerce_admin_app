import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../utils/functionalities/provider.dart';
import '../widgets/atm_card.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Users> usersList = [
      Users("assets/images/user1.jpg", "sheela Tani", "sheela1@gmail.com"),
      Users("assets/images/user2.jpg", "Handro Horn", "handro23@gmail.com"),
      Users("assets/images/user3.jpg", "Mansi moro", "mansi66@gmail.com"),
      Users("assets/images/user4.jpg", "Danor drano", "danor34@gmail.com"),
      Users(
          "assets/images/user5.jpg", "Paksilan parten", "paksilan45@gmail.com"),
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isTranslated =
        Provider.of<FunctionalitiesProvider>(context).getMessageCardAnimation;
    return Container(
      height: height,
      color: Colors.grey.shade50,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Messages",
                style: GoogleFonts.lato()
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: height * 0.02),
            ...List.generate(usersList.length,
                (i) => MessageCard(users: usersList[i], index: i)),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Carts",
                style: GoogleFonts.lato()
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: height * 0.025),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              transform: Matrix4.translationValues(
                  isTranslated ? 0.0 : 50.0, 0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.squarePlus,
                                  color: primaryColor),
                              const SizedBox(width: 10),
                              const Text(
                                "Add to carts",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
                transform: Matrix4.translationValues(
                    -(isTranslated ? 0.0 : 50.0), 0.0, 0.0),
                child: const CreditCardsPage()),
          ],
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final Users users;
  final int index;

  const MessageCard({super.key, required this.users, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isTranslated =
        Provider.of<FunctionalitiesProvider>(context).getMessageCardAnimation;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      transform: Matrix4.translationValues(
          isTranslated ? 0.0 : ((index + 1) * 50.0), 0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
        child: Material(
          child: InkWell(
            onTap: () {},
            hoverColor: Colors.grey.shade100,
            splashColor: Colors.grey,
            child: Ink(
              // color: Colors.white,
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
