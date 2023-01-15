import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/data/categories_mock.dart';
import 'package:food_delivery/data/foods.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/models/categories.dart';
import 'package:food_delivery/screen/categories_screen/all_catogories_screen.dart';
import 'package:food_delivery/widgets/app_bar.dart';
import 'package:food_delivery/widgets/category_navigation_bar.dart';
import 'package:food_delivery/widgets/food_card.dart';
import 'package:food_delivery/widgets/show_more_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBarText(),
          CategoryNavigationBar(
            initialIndex: _selectedTabIndex,
            pages: categoryList,
            onTabChanged: (tabIndex) {
              setState(() {
                _selectedTabIndex = tabIndex;
              });
            },
          ),
          _buildContent(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          AllCategoryScreen(),
          SizedBox(
            width: 20,
          ),
          ShowMoreButton(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
