import 'package:dsa_final/cards/restaurant_card.dart';
import 'package:dsa_final/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CustomerMainScreen extends StatelessWidget {
  const CustomerMainScreen({Key? key}) : super(key: key);

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
        height: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: Colors.white),
        child: Flexible(
          fit: FlexFit.loose,
          child: ListView.separated(
            itemCount: 10, // TODO: Backend Work
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) {
              // TODO: Backend Work
              return RestaurantCard(
                logo: Image.asset(
                  "assets/images/restaurant_logo_placeholder.png",
                  width: 50
                ),
                background: Image.asset(
                  "assets/images/restaurant_placeholder.jpg"
                ),
                name: "Restaurant Name",
                address: "Address"
              );
            }
          ),
        )
      ),
    );
  }
}