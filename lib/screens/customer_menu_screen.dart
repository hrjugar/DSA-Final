import 'package:dsa_final/database/food.dart';
import 'package:flutter/material.dart';
import 'package:dsa_final/database/restaurant.dart';
import 'dart:math';

class CustomerMenuScreen extends StatelessWidget {
  final Restaurant restaurant;
  final int restaurantIndex;

  const CustomerMenuScreen({
    Key? key, 
    required this.restaurant,
    required this.restaurantIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _RestaurantHeaderDelegate(restaurant, restaurantIndex)
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
                    child: Container(
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
                              child: restaurant.menu[index].image,
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(restaurant.menu[index].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text("₱" + restaurant.menu[index].price
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
                                      Text("0", 
                                        style: TextStyle(
                                          fontSize: 20
                                        )
                                      ),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {

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
              childCount: restaurants[restaurantIndex].menu.length
            ),
          )
        ],
      ),
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
                  borderRadius: BorderRadius.circular(10),
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