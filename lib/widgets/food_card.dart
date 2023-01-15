import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/provider/favorite.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  bool _isFav(BuildContext context, int id) {
    final FavoriteModel fav = Provider.of<FavoriteModel>(context);
    final idx = fav.favoriteList.indexWhere((fav) => fav.food.id == id);
    return idx != -1;
  }

  @override
  Widget build(BuildContext context) {
    final FavoriteModel fav = Provider.of<FavoriteModel>(context);

    return Container(
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
              backgroundImage: AssetImage(food.image),
            ),
          ),
          // Price
          Positioned(
            right: 20,
            top: 80,
            child: Text(
              "\THB${food.price}",
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
                    food.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 16),
                  Text(
                    food.description,
                    maxLines: 5,
                    style: TextStyle(
                        color: primaryColor.withOpacity(.65),
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${food.cal} Kcal',
                      ),
                      IconButton(
                        onPressed: () {
                          fav.favorite(food);
                        },
                        icon: _isFav(context, food.id)
                            ? const Icon(
                                Icons.favorite,
                                color: primaryColor,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: primaryColor,
                              ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
