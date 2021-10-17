import 'package:dsa_final/database/food.dart';
import 'package:dsa_final/database/order.dart';
import 'package:dsa_final/database/restaurant.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class RestaurantMainScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantMainScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepOrange,
        title: Text("orders"),
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
      body: restaurant.orders.isEmpty
      ? Center(child: Text("There are currently no orders :("))
      : ListView.builder(
          shrinkWrap: true,
          itemCount: restaurant.orders.length,
          itemBuilder: (context, index) {
          Order order = restaurant.orders[index];
          return ExpansionTile(
            title: Text(order.customer.username,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(order.timeOrdered.toString().substring(0, 19)),
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  Food food = order.items.keys.elementAt(index);
                  int count = order.items.values.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Card(
                      color: Colors.grey[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: ListTile(
                        leading: SizedBox(width: 50, child: food.image),
                        title: Text(food.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text("₱" + 
                          (food.price * count).toStringAsFixed(2)
                        ),
                        trailing: Text("Qty: $count"),
                      ),
                    ),
                  );
                }
              )
            ],
          );
        }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // TODO: Backend Work (queue)
        },
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Text("deliver",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}