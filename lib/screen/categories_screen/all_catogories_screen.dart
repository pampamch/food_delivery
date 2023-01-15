import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/data/foods.dart';
import 'package:food_delivery/widgets/food_card.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: allFoods
          .map(
            (food) => FoodCard(
              food: food,
            ),
          )
          .toList(),
    );
  }
}
