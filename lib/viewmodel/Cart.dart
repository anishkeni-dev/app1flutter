import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../viewmodel/Cart.dart';
import '../view/Widgets/cart_w.dart';

Showcart(product,context) {
  return ListView.builder(
    itemCount: 2,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(product.title, style: TextStyle(color: Colors.white),),
        );
      }
  );
}