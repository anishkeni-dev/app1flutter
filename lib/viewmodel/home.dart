import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/Widgets/home_w.dart';
import '../view/screens/cart_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/screens/product_screen.dart';
import 'dart:math' as math;

getimage(snapshot, index, context){
  return Image.network(
    snapshot.data[index].image,
    width: 120,
    height: 120,
  );
}

getname(snapshot, index, context){
  return AutoSizeText(
    snapshot.data[index].title,
    overflow: TextOverflow.ellipsis,
  );
}

getprice(snapshot, index, context){
  return AutoSizeText("\$" + snapshot.data[index].price);
}
addtocart(snapshot, index, context){
  Map<String, String> prods = Map();
  prods['product_img'] = snapshot.data[index].image;
  prods['product_name'] = snapshot.data[index].title;
  prods['product_price'] = snapshot.data[index].price;
  prods['rating'] = snapshot.data[index].rating;
  prods['desc'] = snapshot.data[index].desc;
  getcart(prods);
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext ctx) => MyCart()));
}

