import 'package:flutter/material.dart';

class Restaurant {
  Image background;
  Image logo;
  String name;
  String address;

  Restaurant({
    required this.background,
    required this.logo,
    required this.name,
    required this.address
  });
}

List<Restaurant> restaurants = restaurantsData
  .map(
    (item) => Restaurant(
      background: item["background"] as Image,
      logo: item["logo"] as Image, 
      name: item["name"] as String, 
      address: item["address"] as String
    )
  ).toList();

var restaurantsData = [
  {
    "background": Image.asset("assets/images/restaurant_logo_placeholder.png"),
    "logo": Image.asset("assets/images/restaurant_logo_placeholder.png"),
    "name": "Restaurant X",
    "address": "Lanang, Davao City, Philippines"
  }
];

