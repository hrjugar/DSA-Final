import 'package:flutter/material.dart';
import 'package:dsa_final/database/restaurant.dart';

class CustomerMenuScreen extends StatelessWidget {
  final Restaurant restaurant;
  final int index;

  const CustomerMenuScreen({
    Key? key, 
    required this.restaurant,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 1080 / (1920 / MediaQuery.of(context).size.width) + 50,
            child: CustomMultiChildLayout(
              delegate: _RestaurantHeaderLayoutDelegate(),
              children: [
                LayoutId(
                  id: _RestaurantHeaderSlot.background,
                  child: Hero(
                    tag: "background" + index.toString(), 
                    child: restaurant.background
                  ),
                ),
                LayoutId(
                  id: _RestaurantHeaderSlot.logo,
                  child: Hero(
                    tag: "logo" + index.toString(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 100,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: restaurant.logo,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Hero(
                tag: "name" + index.toString(),
                child: Material(
                  child: Text(restaurant.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Hero(
                tag: "address" + index.toString(), 
                child: Material(
                  child: Text(restaurant.address,
                    textAlign: TextAlign.center
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _RestaurantHeaderLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Size backgroundSize = Size.zero;
    double currentHeight = 0;

    if (hasChild(_RestaurantHeaderSlot.background)) {
      backgroundSize = layoutChild(
        _RestaurantHeaderSlot.background, 
        BoxConstraints.loose(size)
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
          backgroundSize.width / 2 - logoSize.width / 2,
          currentHeight - logoSize.height / 2
        )
      );

      currentHeight += logoSize.height / 2;
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}

enum _RestaurantHeaderSlot {
  background, 
  logo,
  name,
  address
}