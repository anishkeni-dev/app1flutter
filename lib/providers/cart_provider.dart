import 'package:app1/providers/product_model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  bool iscart = false;

  late List<Catalog> cartlistbyid = [];
  late double carttotal = 0;


  addtocart(element) {
    if(cartlistbyid.contains(element))
      {
        return null;
      }
    else {
      cartlistbyid.add(element);
      var productprice = double.parse(element.price);
      carttotal = carttotal + productprice;
      iscart = true;
      notifyListeners();
    }


  }

  removefromcart(element) {
    cartlistbyid.remove(element);
    var productprice = double.parse(element.price);
    carttotal = carttotal - productprice;
    iscart = false;
    notifyListeners();
  }


}