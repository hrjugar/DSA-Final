import 'package:flutter/material.dart';
import 'food.dart';
import 'order.dart';

class Restaurant {
  Image background;
  Image logo;
  String name;
  String address;
  double deliveryFee;
  List<Food> menu;
  List<Order> orders;

  Restaurant({
    required String backgroundPath, 
    required String logoPath, 
    required this.name, 
    required this.address,
    required this.menu
  }) : background = Image.asset(backgroundPath),
        logo = Image.asset(logoPath),
        deliveryFee = 20.0,
        orders = [];
}

// TODO: Backend Work, add more data here
List<Restaurant> restaurants = [
  Restaurant(
    backgroundPath: "assets/images/restaurant_placeholder.jpg", 
    logoPath: "assets/images/restaurant_logo_placeholder.png", 
    name: "Restaurant X", 
    address: "Lanang, Davao City, Philippines", 
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
      ),
      Food(
        name: "Food Name 4", 
        price: 400, 
        imagePath: "assets/images/menu_item_placeholder.png"
      )
    ]
  ),
  Restaurant(
    backgroundPath: "assets/images/restaurant_placeholder.jpg", 
    logoPath: "assets/images/restaurant_logo_placeholder.png", 
    name: "Restaurant Y", 
    address: "Address Y", 
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
    name: "Restaurant Z", 
    address: "Mt. Apo, Philippines", 
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