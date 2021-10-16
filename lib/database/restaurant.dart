import 'package:flutter/material.dart';

class Restaurant {
  Image background;
  Image logo;
  String name;
  String address;

  Restaurant({
    required String backgroundPath, 
    required String logoPath, 
    required this.name, 
    required this.address
  }) : background = Image.asset(backgroundPath),
        logo = Image.asset(logoPath);
}

List<Restaurant> restaurants = restaurantsData
  .map(
    (item) => Restaurant(
      backgroundPath: item["background"] as String,
      logoPath: item["logo"] as String, 
      name: item["name"] as String, 
      address: item["address"] as String
    )
  ).toList();

var restaurantsData = [
  {
    "background": "assets/images/restaurant_placeholder.jpg",
    "logo": "assets/images/restaurant_logo_placeholder.png",
    "name": "Restaurant X",
    "address": "Lanang, Davao City, Philippines"
  }
];

