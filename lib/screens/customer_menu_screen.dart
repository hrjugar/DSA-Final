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
            height: MediaQuery.of(context).size.height / 2.5,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 100,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Hero(
                          tag: "logo" + index.toString(), 
                          child: restaurant.logo
                        ),
                      ),
                    ),
                  ),
                ),
                LayoutId(
                  id: _RestaurantHeaderSlot.name,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      heightFactor: 1,
                      child: Hero(
                        tag: "name" + index.toString(),
                        child: Material(
                          child: Text(restaurant.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        )
                      ),
                    ),
                  )
                ),
                LayoutId(
                  id: _RestaurantHeaderSlot.address, 
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Center(
                      heightFactor: 1,
                      child: Hero(
                        tag: "address" + index.toString(), 
                        child: Material(
                          child: Text(restaurant.address
                          ),
                        )
                      ),
                    ),
                  )
                )
              ],
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

    if (hasChild(_RestaurantHeaderSlot.name)) {
      final nameSize = layoutChild(
        _RestaurantHeaderSlot.name,
        BoxConstraints.loose(size)
      );

      positionChild(
        _RestaurantHeaderSlot.name, 
        Offset(
          backgroundSize.width / 2 - nameSize.width / 2,
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
          backgroundSize.width / 2 - addressSize.width / 2, 
          currentHeight + 5
        )
      );
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