import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/Cart.dart';
import '../view/Widgets/cart_w.dart';

Showcart(context,products) {
  return Container(
    child:
        getproductname_price(products, context),
  );
}