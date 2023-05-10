import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../responsive.dart';
import '../screens/home/components/drawer_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0.0,
      width: 200,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.05),
            const TitleLogoWidget(),
            SizedBox(height: height * 0.03),
            SizedBox(
              height: 350,
              width: 200,
              child: ListView.builder(
                  itemCount: iconsList.length,
                  itemBuilder: (context, i) {
                    return DrawerTileWidgets(
                        iconsModel: iconsList[i], index: i);
                  }),
            ),
            const SizedBox(height: 20),
            Responsive.isMobile(context)
                ? SizedBox(
                    height: height * 0.1,
                  )
                : Container(),
            // const OfferCardWidget(),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: ListTile(
                  horizontalTitleGap: 15,
                  onTap: () {},
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/myImage.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  title: const Text("Sivaram pr",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  subtitle: const Text(
                    "ram614709@gmail.com",
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleLogoWidget extends StatelessWidget {
  const TitleLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icons/logo_wolf.png",
          fit: BoxFit.cover,
          height: 30,
          width: 30,
        ),
        const SizedBox(width: 5),
        const Text(
          appName,
          style: TextStyle(
              fontFamily: "Bruno",
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
