import 'package:app1/providers/product_model.dart';
import 'package:flutter/material.dart';

class Wishlist extends ChangeNotifier {
  late List<Catalog> wishlistbyid = [];
  bool iswished = false;
  addtowishlist(element){
    if(iswished == true)
    {
      return null;

    }
    else {
      wishlistbyid.add(element);
      iswished = true;
    }

  notifyListeners();
  }
  removefromwishlist(element){
  iswished = false;
  wishlistbyid.remove(element);
  element.isincart = false;
  notifyListeners();
  }


}