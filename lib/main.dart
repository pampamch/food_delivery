import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        scaffoldBackgroundColor: white,
        primaryColor: primaryColor,
        textTheme: const TextTheme(
            headline5: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
            button: TextStyle(fontWeight: FontWeight.bold)),
      ),
      home: const HomeScreen(),
    );
  }
}
