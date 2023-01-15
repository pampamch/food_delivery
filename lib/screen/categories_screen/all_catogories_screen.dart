import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/data/foods.dart';
import 'package:food_delivery/widgets/food_card.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: allFoods
            .map(
              (food) => FoodCard(
                title: food.name,
                image: food.image,
                price: food.price,
                calories: food.cal.toString(),
                description: food.description,
                press: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
