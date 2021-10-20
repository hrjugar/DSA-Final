import 'package:flutter/material.dart';

class Food {
  String name;
  double price;
  Image image;

  Food({
    required this.name,
    required this.price,
    required String imagePath
  }) : image = Image.asset(imagePath, height: 90, width: 90,);
}