import 'package:ecommerce_admin_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../models/icons_model.dart';
import '../../../utils/functionalities/provider.dart';

class DrawerTileWidgets extends StatelessWidget {
  final IconsModel iconsModel;
  final int index;

  const DrawerTileWidgets(
      {super.key, required this.iconsModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final selectedIndex =
        Provider.of<FunctionalitiesProvider>(context).getCurrentPageIndex;
    bool isActive = index == selectedIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: InkWell(
        onTap: () {
          if (index == 6) {
          } else {
            context.read<FunctionalitiesProvider>().changePageIndex(index);
          }
        },
        child: Container(
          height: 35,
          // width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isActive && iconsList.length - 1 == selectedIndex
                ? Colors.red
                : isActive
                    ? darkBlue
                    : null,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isActive ? iconsModel.selectedIcon : iconsModel.defaultIcon,
                const SizedBox(width: 10), // prompt
                Text(iconsModel.title,
                    style: GoogleFonts.lato().copyWith(
                        color: isActive
                            ? iconsModel.selectedColor
                            : iconsModel.defaultColor,
                        fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
