import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/provider/cart.dart';
import 'package:food_delivery/provider/favorite.dart';
import 'package:food_delivery/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(
          create: (context) => CartModel(),
        ),
        ChangeNotifierProvider<FavoriteModel>(
          create: (context) => FavoriteModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              titleTextStyle: TextStyle(
                color: primaryColor,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              elevation: 0.6,
              iconTheme: IconThemeData(color: primaryColor)),
          scaffoldBackgroundColor: white,
          primaryColor: primaryColor,
          textTheme: const TextTheme(
              headline5: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              button: TextStyle(fontWeight: FontWeight.bold)),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
