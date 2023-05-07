import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';
import '../screens/home/components/offer_card.dart';
import '../screens/home/components/tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            const TitleLogoWidget(),
            SizedBox(height: height * 0.03),
            SizedBox(
              height: 350,
              child: ListView.builder(
                  itemCount: iconsList.length,
                  itemBuilder: (context, i) {
                    return TileWidgets(iconsModel: iconsList[i], index: i);
                  }),
            ),
            const SizedBox(height: 20),
            Responsive.isMobile(context)
                ? SizedBox(
                    height: height * 0.1,
                  )
                : Container(),
            const OfferCardWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: ClipRRect(
                  child: Image.asset("assets/images/logo_name.png"),
                ),
                title: const Text("Sivaram pr"),
                subtitle: const Text("ram614709@gmail.com"),
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
        Image.asset(
          "assets/images/logo_only.png",
          fit: BoxFit.cover,
          height: 35,
          width: 35,
        ),
      ],
    );
  }
}
