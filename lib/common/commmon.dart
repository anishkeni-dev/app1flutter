
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../providers/cart_provider.dart';
import '../view/screens/cart_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/wishlist_screen.dart';

Badge cartbadge(Cart cartp, context) {
  return Badge(
      position: BadgePosition.topEnd(top: 0,end: 20),
      badgeColor: Colors.red,
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Center(child: Text(cartp.cartlistbyid.length.toString() ,style: TextStyle(fontSize: 10),)),
      child: TextButton.icon(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext ctx) => const MyCart()));
          },
          icon: Icon(Icons.shopping_cart_rounded,color: Colors.black),

          label: Text(''))
  );
}

Widget bottombar(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      boxShadow: [
        BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        backgroundColor: HexColor("0000"),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: '',
              icon:
              TextButton.icon(icon:Icon(Icons.layers_outlined),
                label: Text('text'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (
                              BuildContext ctx) => HomePage()));
                },
              ) ),
          BottomNavigationBarItem(
              label: '',
              icon: TextButton.icon(icon:Icon(Icons.favorite),
                label: Text('text'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (
                              BuildContext ctx) => const MyWishlist()));
                },
              )),
          BottomNavigationBarItem(
              label: '',
              icon:
              TextButton.icon(icon:Icon(Icons.person),
                label: Text('text'),
                onPressed: () {

                },
              ))
        ],
      ),
    ),
  );
}


