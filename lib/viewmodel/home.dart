import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/Widgets/home_w.dart';
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
