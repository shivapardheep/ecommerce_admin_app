import 'package:ecommerce_admin_app/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(appName,
                          style: Theme.of(context).textTheme.headlineSmall),
                      Image.asset(
                        "assets/images/logo_only.png",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(flex: 5, child: Container(color: Colors.blue)),
          Expanded(flex: 2, child: Container(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}
