import 'package:flutter/material.dart';
import 'food.dart';
import 'order.dart';
import 'order_queue.dart';

class Restaurant {
  String username;
  String password;
  Image background;
  Image logo;
  String name;
  String address;
  double deliveryFee;
  List<Food> menu;
  Queue<Order> orders;

  Restaurant(
      {required this.username,
      required this.password,
      required String backgroundPath,
      required String logoPath,
      required this.name,
      required this.address,
      required this.menu})
      : background = Image.asset(backgroundPath),
        logo = Image.asset(logoPath),
        deliveryFee = 20.0,
        orders = new Queue();
}

List<Restaurant> restaurants = [
  Restaurant(
      username: "jollibee",
      password: "r1",
      backgroundPath: "assets/images/jollibee_background.jpg",
      logoPath: "assets/images/jollibee_logo.png",
      name: "Jollibee",
      address: "Lanang, Davao City, Philippines",
      menu: [
        Food(
            name: "Burger Steak",
            price: 65,
            imagePath: "assets/images/jollibee_burgerSteak.png"),
        Food(
            name: "Chickenjoy",
            price: 84,
            imagePath: "assets/images/jollibee_chickenjoy.png"),
        Food(
            name: "Jolly Spaghetti",
            price: 55,
            imagePath: "assets/images/jollibee_spaghetti.png"),
        Food(
            name: "Yum Burger",
            price: 39,
            imagePath: "assets/images/jollibee_yumBurger.jpg")
      ]),
  Restaurant(
      username: "kfc",
      password: "r2",
      backgroundPath: "assets/images/kfc_background.jpg",
      logoPath: "assets/images/kfc_logo.png",
      name: "KFC",
      address: "Address Y",
      menu: [
        Food(
            name: "Bucket Fries",
            price: 150,
            imagePath: "assets/images/kfc_bucketFries.png"),
        Food(
            name: "Mashed Potato",
            price: 45,
            imagePath: "assets/images/kfc_mashedPotato.png"),
        Food(
            name: "Zinger Steak",
            price: 110,
            imagePath: "assets/images/kfc_zingerSteak.jpg")
      ]),
  Restaurant(
      username: "mcdo",
      password: "r3",
      backgroundPath: "assets/images/mcdo_background.jpg",
      logoPath: "assets/images/mcdo_logo.png",
      name: "McDonald's",
      address: "Mt. Apo, Philippines",
      menu: [
        Food(
            name: "Chicken Fillet",
            price: 120,
            imagePath: "assets/images/mcdo_chickenFillet.png"),
        Food(
            name: "Large Fries",
            price: 140,
            imagePath: "assets/images/mcdo_fries.jpeg"),
        Food(
            name: "Chicken McNuggets",
            price: 145,
            imagePath: "assets/images/mcdo_nuggets.png")
      ])
];
