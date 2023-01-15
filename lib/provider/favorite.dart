import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/models/favorite.dart';
import 'package:food_delivery/models/food.dart';

class FavoriteModel extends ChangeNotifier {
  List<Favorite> _favoriteList = [];

  //getter
  List<Favorite> get favoriteList => _favoriteList;

  void favorite(Food food) {
    final idx = _getIdxInList(food.id);
    final bool isDuplicated = idx != -1;

    if (isDuplicated) {
      _favoriteList.removeAt(idx);
    } else {
      _favoriteList.add(
        Favorite(food: food),
      );
    }

    notifyListeners();
  }

  int _getIdxInList(int id) {
    final idx = _favoriteList.indexWhere((fav) => fav.food.id == id);
    return idx;
  }
}
