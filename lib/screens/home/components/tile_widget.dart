import 'package:ecommerce_admin_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../models/icons_model.dart';
import '../../../utils/functionalities/provider.dart';

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
          if (index == 6) {
          } else {
            context.read<FunctionalitiesProvider>().changePageIndex(index);
          }
        },
        child: Center(
          child: FittedBox(
            child: Container(
              height: 40,
              width: 170,
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
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                            fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
