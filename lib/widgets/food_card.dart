import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String image;
  final int price;
  final String calories;
  final String description;
  final void Function() press;

  const FoodCard({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.calories,
    required this.description,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 400,
        width: 270,
        child: Stack(
          children: <Widget>[
            // Big light background
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 380,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: primaryColor.withOpacity(.06),
                ),
              ),
            ),
            // Rounded background
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 181,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(.15),
                ),
              ),
            ),
            // Food Image
            Positioned(
              top: 0,
              left: -50,
              height: 184,
              width: 300,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
            ),
            // Price
            Positioned(
              right: 20,
              top: 80,
              child: Text(
                "\THB$price",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: primaryColor),
              ),
            ),
            Positioned(
              top: 201,
              left: 40,
              child: Container(
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 16),
                    Text(
                      description,
                      maxLines: 5,
                      style: TextStyle(
                          color: primaryColor.withOpacity(.65),
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '$calories Kcal',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
