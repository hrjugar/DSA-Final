import 'package:flutter/material.dart';
import 'food.dart';

class Restaurant {
  Image background;
  Image logo;
  String name;
  String address;
  List<Food> menu;

  Restaurant({
    required String backgroundPath, 
    required String logoPath, 
    required this.name, 
    required this.address,
    required this.menu
  }) : background = Image.asset(backgroundPath),
        logo = Image.asset(logoPath);
}

// TODO: Backend Work, add more data here
List<Restaurant> restaurants = [
  Restaurant(
    backgroundPath: "assets/images/restaurant_placeholder.jpg", 
    logoPath: "assets/images/restaurant_logo_placeholder.png", 
    name: "Restaurant X with a very long long long long long name", 
    address: "Lanang, Davao City, Philippines with a very long long long long long address", 
    menu: [
      Food(
        name: "Food Name 1", 
        price: 100, 
        imagePath: "assets/images/menu_item_placeholder.png"
      ),
      Food(
        name: "Food Name 2",
        price: 200,
        imagePath: "assets/images/menu_item_placeholder.png"
      ),
      Food(
        name: "Food Name 3",
        price: 300,
        imagePath: "assets/images/menu_item_placeholder.png"
      )
    ]
  ),
  Restaurant(
    backgroundPath: "assets/images/restaurant_placeholder.jpg", 
    logoPath: "assets/images/restaurant_logo_placeholder.png", 
    name: "Restaurant Name", 
    address: "Address", 
    menu: [
      Food(
        name: "Food Name 1", 
        price: 100, 
        imagePath: "assets/images/menu_item_placeholder.png"
      ),
      Food(
        name: "Food Name 2",
        price: 200,
        imagePath: "assets/images/menu_item_placeholder.png"
      ),
      Food(
        name: "Food Name 3",
        price: 300,
        imagePath: "assets/images/menu_item_placeholder.png"
      )
    ]
  ),
  Restaurant(
    backgroundPath: "assets/images/restaurant_placeholder.jpg", 
    logoPath: "assets/images/restaurant_logo_placeholder.png", 
    name: "Restaurant X with a very long long long long long name", 
    address: "Lanang, Davao City, Philippines with a very long long long long long address", 
    menu: [
      Food(
        name: "Food Name 1", 
        price: 100, 
        imagePath: "assets/images/menu_item_placeholder.png"
      ),
      Food(
        name: "Food Name 2",
        price: 200,
        imagePath: "assets/images/menu_item_placeholder.png"
      ),
      Food(
        name: "Food Name 3",
        price: 300,
        imagePath: "assets/images/menu_item_placeholder.png"
      )
    ]
  )  
];