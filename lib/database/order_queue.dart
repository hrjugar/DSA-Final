// import 'package:dsa_final/database/order.dart';
// import 'package:flutter/gestures.dart';

class Queue<Order> {
  List<Order> orderList = [];

  void enqueue(Order order) {
    orderList.add(order);
  }

  Order dequeue() {
    late Order temp;
    if (orderList.isNotEmpty) {
      temp = orderList[0];
      orderList.remove(temp);
    }
    return temp;
  }
}
