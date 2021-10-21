import 'package:dsa_final/database/food.dart';
import 'package:dsa_final/database/order.dart';
import 'package:dsa_final/database/restaurant.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class RestaurantMainScreen extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantMainScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  _RestaurantMainScreenState createState() => _RestaurantMainScreenState();
}

class _RestaurantMainScreenState extends State<RestaurantMainScreen> {

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: widget.restaurant.orders.orderList.isEmpty
          ? Center(child: Text("There are currently no orders :("))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: widget.restaurant.orders.orderList.length,
              itemBuilder: (context, index) {
                Order order = widget.restaurant.orders.orderList[index];
                return ExpansionTile(
                  title: Text(
                    order.customer.username,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(order.timeOrdered.toString().substring(0, 19)),
                  children: [
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return ListView.builder(
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
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ListTile(
                                    leading: SizedBox(width: 50, child: food.image),
                                    title: Text(
                                      food.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text("₱" +
                                        (food.price * count).toStringAsFixed(2)),
                                    trailing: Text("Qty: $count"),
                                  ),
                                ),
                              );
                            });
                      }
                    )
                  ],
                );
              }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          String snackbarText = "";
          setState(() {
            if (widget.restaurant.orders.orderList.isEmpty) {
              snackbarText = "No orders to deliver for.";
            } else {
              snackbarText  = "Delivering...";
              widget.restaurant.orders.dequeue();
            }
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(snackbarText, textAlign: TextAlign.center),
              behavior: SnackBarBehavior.floating,
              duration: Duration(milliseconds: 2000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
            )
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(
              "deliver",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
