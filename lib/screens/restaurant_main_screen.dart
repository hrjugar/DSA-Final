import 'package:dsa_final/database/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantMainScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantMainScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Restaurant Screen")
        ],
      ),
    );
  }
}