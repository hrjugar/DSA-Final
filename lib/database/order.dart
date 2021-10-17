import 'customer.dart';
import 'food.dart';

class Order {
  Map<Food, int> items;
  Customer customer;
  DateTime timeOrdered;
  
  Order({
    required this.items, 
    required this.customer
  }) : timeOrdered = DateTime.now();
}