import 'package:flutter/gestures.dart';

class Queue<Order> {
  List<Order> orderList = [];

  void enqueue(Order order) {
    orderList.add(order);
  }

  Object dequeue() {
    var temp = null;
    if (!orderList.isEmpty) {
      temp = orderList[0];
      orderList.remove(temp);
      print(orderList);
    }
    return temp;
  }
}
