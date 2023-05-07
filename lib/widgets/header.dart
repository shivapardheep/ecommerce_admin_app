import 'package:flutter/material.dart';

import '../constants.dart';

class HeaderWidget extends StatefulWidget {
  final double height;
  final GlobalKey<ScaffoldState> scaffold;

  const HeaderWidget({super.key, required this.height, required this.scaffold});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  void _openEndDrawer() {
    widget.scaffold.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: widget.height * 0.05, horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade200)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icons/search.png",
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: _openEndDrawer,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Center(
                  child: Badge(
                    label: Text('5', style: TextStyle(color: Colors.white)),
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(width: 30),
        ],
      ),
    );
  }
}
