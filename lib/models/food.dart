import 'package:flutter/material.dart';

class Food {
  final String name;
  final String image;
  final String description;
  final int price;
  final int cal;
  // final Widget child;

  Food({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.cal,
  });
}
