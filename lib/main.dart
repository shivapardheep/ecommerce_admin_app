import 'package:ecommerce_admin_app/screens/dashboard/provider/orders/provider.dart';
import 'package:ecommerce_admin_app/screens/home/home_screen.dart';
import 'package:ecommerce_admin_app/utils/functionalities/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FunctionalitiesProvider()),
          ChangeNotifierProvider(create: (_) => LatestOrdersProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          home: const MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
