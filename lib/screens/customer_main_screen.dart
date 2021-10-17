import 'package:dsa_final/cards/restaurant_card.dart';
import 'package:dsa_final/database/customer.dart';
import 'package:dsa_final/database/restaurant.dart';
import 'package:dsa_final/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomerMainScreen extends StatelessWidget {
  final Customer customer;
  const CustomerMainScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        title: Text("restaurants"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => LoginScreen()
                )
              );
            }, 
            icon: Icon(Icons.logout)
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: Colors.white),
        child: Flexible(
          fit: FlexFit.loose,
          child: ListView.separated(
            itemCount: restaurants.length, // TODO: Backend Work
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) => RestaurantCard(
              customer: customer,
              restaurant: restaurants[index],
              restaurantIndex: index
            )
          ),
        )
      ),
    );
  }
}