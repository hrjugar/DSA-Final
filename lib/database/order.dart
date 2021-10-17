import 'restaurant.dart';
import 'food.dart';

class Order {
  Map<Food, int> items;
  DateTime timeOrdered;
  
  Order({required this.items}) : timeOrdered = DateTime.now();
}