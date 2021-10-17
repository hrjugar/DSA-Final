import 'package:dsa_final/screens/customer_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:dsa_final/database/restaurant.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;
  final int restaurantIndex;
  
  const RestaurantCard({Key? key, 
    required this.restaurant,
    required this.restaurantIndex
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => CustomerMenuScreen(
                restaurant: widget.restaurant,
                restaurantIndex: widget.restaurantIndex
              )
            )
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          child: CustomMultiChildLayout(
            delegate: _RestaurantCardLayoutDelegate(),
            children: [
              LayoutId(
                id: _RestaurantCardSlot.background, 
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Hero(
                    tag: "background" + widget.restaurantIndex.toString(),
                    child: widget.restaurant.background
                  )
                )
              ),
              LayoutId(
                id: _RestaurantCardSlot.logo, 
                child: Hero(
                  tag: "logo" + widget.restaurantIndex.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: widget.restaurant.logo
                      )
                    )
                  ),
                )
              ),
              LayoutId(
                id: _RestaurantCardSlot.name,
                 child: SizedBox(
                   width: MediaQuery.of(context).size.width * 0.75,
                   child: Hero(
                     tag: "name" + widget.restaurantIndex.toString(),
                     child: Material(
                       child: Text(widget.restaurant.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
                       ),
                     ),
                   ),
                 )
              ),
              LayoutId(
                id: _RestaurantCardSlot.address, 
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Hero(
                    tag: "address" + widget.restaurantIndex.toString(),
                    child: Material(
                      child: Text(widget.restaurant.address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              )
            ],
          )
        ),
      ),
    );
  }
}

class _RestaurantCardLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    double currentHeight = 0;
    Size logoSize = Size.zero;

    if (hasChild(_RestaurantCardSlot.background)) {
      currentHeight = layoutChild(
        _RestaurantCardSlot.background, 
        BoxConstraints.loose(size)
      ).height;
    }

    if (hasChild(_RestaurantCardSlot.logo)) {
      logoSize = layoutChild(
        _RestaurantCardSlot.logo,
        BoxConstraints.loose(size)
      );

      positionChild(
        _RestaurantCardSlot.logo, 
        Offset(
          logoSize.width / 2, 
          currentHeight - logoSize.height / 2
        )
      );

      currentHeight += (logoSize.height / 2);
    }

    if (hasChild(_RestaurantCardSlot.name)) {
      final nameHeight = layoutChild(
        _RestaurantCardSlot.name, 
        BoxConstraints.loose(size)
      ).height;

      positionChild(
        _RestaurantCardSlot.name,
        Offset(
          logoSize.width / 2,
          currentHeight + 10
        )
      );

      currentHeight = currentHeight + nameHeight + 10;
    }

    if (hasChild(_RestaurantCardSlot.address)) {
      layoutChild(
        _RestaurantCardSlot.address, 
        BoxConstraints.loose(size)
      ).height;

      positionChild(
        _RestaurantCardSlot.address, 
        Offset(
          logoSize.width / 2,
          currentHeight + 5
        )
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}

enum _RestaurantCardSlot {
  background,
  logo,
  name,
  address
}