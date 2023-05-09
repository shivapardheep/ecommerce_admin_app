import 'package:ecommerce_admin_app/utils/functionalities/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../dashboard.dart';

class IntroCards extends StatelessWidget {
  const IntroCards({
    super.key,
    required this.iconsList,
  });

  final List<IconsModel> iconsList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ...List.generate(
                iconsList.length,
                (index) => MainCardWidget(
                      iconsModel: iconsList[index],
                      index: index,
                    )..index),
            // MainCardWidget(iconsModel: iconsList[0]),
          ],
        ),
      ),
    );
  }
}

class MainCardWidget extends StatelessWidget {
  final IconsModel iconsModel;
  final int index;

  const MainCardWidget(
      {super.key, required this.iconsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isTranslated =
        Provider.of<FunctionalitiesProvider>(context).getIntroCardAnimation;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
      transform: Matrix4.translationValues(
          isTranslated ? 0.0 : -((index + 1) * 50.0),
          isTranslated ? 0.0 : -((index + 1) * 50.0 + 5),
          0.0),
      child: Container(
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(iconsModel.image, fit: BoxFit.cover)),
              const SizedBox(height: 10),
              Text(iconsModel.title, style: GoogleFonts.lato()),
              const SizedBox(height: 10),
              Text(iconsModel.value,
                  style: GoogleFonts.viga()
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
