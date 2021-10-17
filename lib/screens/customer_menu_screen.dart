import 'package:dsa_final/database/customer.dart';
import 'package:dsa_final/database/food.dart';
import 'package:dsa_final/database/order.dart';
import 'package:dsa_final/screens/customer_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:dsa_final/database/restaurant.dart';
import 'dart:math';

class CustomerMenuScreen extends StatefulWidget {
  final Customer customer;
  final Restaurant restaurant;
  final int restaurantIndex;

  const CustomerMenuScreen({
    Key? key, 
    required this.customer,
    required this.restaurant,
    required this.restaurantIndex
  }) : super(key: key);

  @override
  State<CustomerMenuScreen> createState() => _CustomerMenuScreenState();
}

class _CustomerMenuScreenState extends State<CustomerMenuScreen> {
  late List<ValueNotifier<int>> _counters;
  final ValueNotifier<double> _foodPrice = ValueNotifier(0);

  @override
  void initState() {
    _counters = List.generate(
      widget.restaurant.menu.length, 
      (index) => ValueNotifier<int>(0)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Food> menu = widget.restaurant.menu;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _RestaurantHeaderDelegate(widget.restaurant, widget.restaurantIndex)
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3
            )
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text("menu",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18, 
                    vertical: 9
                  ),
                  child: Card(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 125,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 125,
                                maxHeight: 100
                              ),
                              child: menu[index].image,
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(menu[index].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("₱" + menu[index].price
                                    .toStringAsFixed(2), 
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                    )
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _counters[index].value = max(
                                              0, 
                                              _counters[index].value - 1
                                            );

                                            _foodPrice.value = max(
                                              0,
                                              _foodPrice.value - menu[index].price
                                            );
                                          },
                                          child: Icon(Icons.remove, 
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor: 
                                              MaterialStateProperty.all(
                                                Colors.deepOrange
                                            ),
                                            shape: MaterialStateProperty.all(
                                              CircleBorder()
                                            )
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      ValueListenableBuilder<int>(
                                        valueListenable: _counters[index],
                                        builder: (context, value, child) {
                                          return Text("$value", 
                                            style: TextStyle(
                                              fontSize: 20
                                            )
                                          );
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _counters[index].value++;
                                            _foodPrice.value +=
                                              menu[index].price;
                                          },
                                          child: Icon(Icons.add, 
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor: 
                                              MaterialStateProperty.all(
                                                Colors.deepOrange
                                            ),
                                            shape: MaterialStateProperty.all(
                                              CircleBorder()
                                            )
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: restaurants[widget.restaurantIndex].menu.length
            ),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("view your cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )
                ),
                ValueListenableBuilder(
                  valueListenable: _foodPrice, 
                  builder: (context, value, child) {
                    return Text("₱" + (value as double).toStringAsFixed(2),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    );
                  }
                )
              ],
            ),
          ),
        ),        
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            context: context, 
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("cart",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      _counters.any((element) => element.value > 0)
                      ? Column(
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: menu.length,
                              itemBuilder: (context, index) {
                                if (_counters[index].value > 0) {
                                  return Card(
                                    color: Colors.grey[50],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ListTile(
                                      leading: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: menu[index].image
                                      ),
                                      title: Text(menu[index].name),
                                      subtitle: Text("Qty: ${_counters[index].value}"),
                                      trailing: Text("₱" + 
                                        (menu[index].price * _counters[index].value)
                                          .toStringAsFixed(2)
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox(height: 0);
                                }
                              }
                            ),
                            SizedBox(height: 50),
                            Container(
                              padding: const EdgeInsets.only(right: 8),
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("subtotal: ₱" + 
                                    (_foodPrice.value).toStringAsFixed(2),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("delivery fee: ₱" +
                                    widget.restaurant.deliveryFee
                                      .toStringAsFixed(2),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14
                                    ),
                                  ),
                                  SizedBox(height: 5),                                  
                                  Text("total: ₱" + 
                                    (_foodPrice.value + 
                                      widget.restaurant.deliveryFee)
                                        .toStringAsFixed(2),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: RawMaterialButton(
                                onPressed: () {
                                  Map<Food, int> items = {};
                                  _counters.asMap().forEach((index, counter) {
                                    if (counter.value > 0) {
                                      items[menu[index]] = counter.value;
                                    }
                                   });

                                  widget.restaurant.orders.add(
                                    Order(
                                      items: items, 
                                      customer: widget.customer
                                    )
                                  );

                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) => CustomerMainScreen(
                                        customer: widget.customer
                                      )
                                    )
                                  );
                                  
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Delivering..."))
                                  );
                                }, 
                                child: Text("pay"),
                                fillColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                            )                              
                          ],
                        )
                      : Center(
                          child: Text("your cart is empty :(",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          )
                        )
                    ],
                  ),
                ),
              );
            }
          );
        },
      )
    );
  }
}

class _RestaurantHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Restaurant restaurant;
  final int index;

  _RestaurantHeaderDelegate(this.restaurant, this.index);  

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CustomMultiChildLayout(
      delegate: _RestaurantHeaderLayoutDelegate(),
      children: [
        LayoutId(
          id: _RestaurantHeaderSlot.background, 
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: max(maxExtent - shrinkOffset, minExtent),
            child: FittedBox(
              fit: BoxFit.cover, 
              clipBehavior: Clip.hardEdge,
              child: Hero(
                tag: "background" + index.toString(),
                child: Material(child: restaurant.background)
              )
            )
          )
        ),
        LayoutId(
          id: _RestaurantHeaderSlot.logo, 
          child: SizedBox(
            width: 100 - shrinkOffset / maxExtent * 50, 
            height: 100 - shrinkOffset / maxExtent * 50, 
            child: FittedBox(
              fit: BoxFit.fill, 
              child: Hero(
                tag: "logo" + index.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: restaurant.logo
                )
              )
            )
          )
        ),
        LayoutId(
          id: _RestaurantHeaderSlot.name, 
          child: Opacity(
            opacity: 1 - shrinkOffset / maxExtent,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Hero(
                tag: "name" + index.toString(),
                child: Material(
                  child: Text(restaurant.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20 - shrinkOffset / maxExtent * 6,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          )
        ),
        LayoutId(
          id: _RestaurantHeaderSlot.address, 
          child: Opacity(
            opacity: max(0, 1 - shrinkOffset / maxExtent * 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Hero(
                tag: "address" + index.toString(),
                child: Material(
                  child: Text(restaurant.address,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16 - shrinkOffset / maxExtent * 6
                    )
                  ),
                ),
              ),
            ),
          )
        )
      ],
    );
  }

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(oldDelegate) => true;
}

class _RestaurantHeaderLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    double currentHeight = 0;

    if (hasChild(_RestaurantHeaderSlot.background)) {
      final backgroundSize = layoutChild(
        _RestaurantHeaderSlot.background, 
        BoxConstraints.loose(size)
      );

      positionChild(
        _RestaurantHeaderSlot.background, 
        Offset.zero
      );

      currentHeight += backgroundSize.height;
    }

    if (hasChild(_RestaurantHeaderSlot.logo)) {
      final logoSize = layoutChild(
        _RestaurantHeaderSlot.logo,
        BoxConstraints.loose(size)
      );

      positionChild(
        _RestaurantHeaderSlot.logo,
        Offset(
          size.width / 2 - logoSize.width / 2,
          currentHeight - logoSize.height / 2
        )
      );

      currentHeight += logoSize.height / 2;
    }

    if (hasChild(_RestaurantHeaderSlot.name)) {
      final nameSize = layoutChild(
        _RestaurantHeaderSlot.name,
        BoxConstraints.loose(size)
      );

      positionChild(
        _RestaurantHeaderSlot.name, 
        Offset(
          size.width / 2 - nameSize.width / 2, 
          currentHeight + 10
        )
      );

      currentHeight += nameSize.height + 10;
    }

    if (hasChild(_RestaurantHeaderSlot.address)) {
      final addressSize = layoutChild(
        _RestaurantHeaderSlot.address,
        BoxConstraints.loose(size)
      );

      positionChild(
        _RestaurantHeaderSlot.address, 
        Offset(
          size.width / 2 - addressSize.width / 2, 
          currentHeight + 10
        )
      );
    }
  }

  @override
  bool shouldRelayout(oldDelegate) => true;
}

enum _RestaurantHeaderSlot {
  background, 
  logo,
  name,
  address
}