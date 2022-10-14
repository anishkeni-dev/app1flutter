import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/Widgets/home_w.dart';
import '../view/screens/cart_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/screens/product_screen.dart';
import 'dart:math' as math;

getimage(datap, index){
  return Image.network(
    datap.dataModel[index].image,
    width: 120,
    height: 120,
  );
}

getname(datap, index){
  return AutoSizeText(
    datap.dataModel[index].title,
    overflow: TextOverflow.ellipsis,
  );
}

getprice(datap, index){
  return AutoSizeText("\$" + datap.dataModel[index].price);
}
// void addtofav(datap,index){
//   datap.datModel[index].isfav = !datap.datModel[index].isfav;
// }
// addtocart(datap, index, context){
//   Map<String, String> prods = Map();
//   prods['product_img'] = datap.dataModel[index].image;
//   prods['product_name'] = datap.dataModel[index].title;
//   prods['product_price'] = datap.dataModel[index].price;
//   prods['rating'] = datap.dataModel[index].rating;
//   prods['desc'] = datap.dataModel[index].desc;
//   getcart(prods);
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (BuildContext ctx) => MyCart()));
// }

