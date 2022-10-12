import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app1/model/product_model.dart';

import '../model/api/product_api.dart';

class Products with ChangeNotifier {
  List<Catalog> get products  {
    return [..._products];
  }
  List<Catalog> _products = [];
  Future<List<Catalog>> get fetchdata async {
    final response = await getRequest();
    _products = json.decode(response.body);
    //Creating a list to store input data;
    // for (var singleProduct in responseData) {
    // Product prods = Product(
    //     id: singleProduct["id"],
    //     title: singleProduct["title"],
    //     price: singleProduct["price"].toString(),
    //     image: singleProduct["image"],
    //     rating: singleProduct["rating"]['rate'].toString(),
    //     desc: singleProduct["description"],
    //   );
    //   //Adding Product to the list.


      return _products;
    }

void addproducts(){
  //_products.add(prods);
  notifyListeners();
}
}


