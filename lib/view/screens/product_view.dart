import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';

import '../Widgets/home.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);
  @override
  State<Product> createState() => _ProductState();
}
var product_no;
var products;
SingleProduct(index,snapshot){
  product_no = index;
  products = snapshot;
  print(products.data[product_no].title);

}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: buildappbar(),
        ),
        body:
            Container(
            child: Text(products.data[product_no].title),
          ),


    );
  }
}
