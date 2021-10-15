import 'package:dsa_final/cards/restaurant_card.dart';
import 'package:flutter/material.dart';

class CustomerMainScreen extends StatelessWidget {
  const CustomerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: Text("restaurants",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )
              ),
            ),
            SizedBox(height: 20),
            Flexible(
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
          ],
        ),
      ),
    );
  }
}