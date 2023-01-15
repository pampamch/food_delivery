import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/favorite.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/provider/favorite.dart';
import 'package:provider/provider.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  bool _isFav(BuildContext context, int id) {
    final FavoriteModel fav = Provider.of<FavoriteModel>(context);
    final idx = fav.favoriteList.indexWhere((fav) => fav.food.id == id);
    return idx != -1;
  }

  @override
  Widget build(BuildContext context) {
    final FavoriteModel fav = Provider.of<FavoriteModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Column(
        children:
            fav.favoriteList.map((food) => _buildFavoriteFood(food)).toList(),
      ),
    );
  }

  Widget _buildFavoriteFood(Favorite favorite) {
    final FavoriteModel fav = Provider.of<FavoriteModel>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(favorite.food.image),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(favorite.food.name),
            ],
          ),
          IconButton(
            onPressed: () {
              fav.favorite(favorite.food);
            },
            icon: _isFav(context, favorite.food.id)
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
      ),
    );
  }
}
