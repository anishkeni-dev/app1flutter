import 'package:app1/providers/product_model.dart';
import 'package:flutter/material.dart';

class Wishlist extends ChangeNotifier {
  late List<Catalog> wishlistbyid = [];
  bool iswished = false;
  addtowishlist(element){


      wishlistbyid.add(element);
      element.isfav = true;

  notifyListeners();
  }
  removefromwishlist(element){
  iswished = false;
  wishlistbyid.remove(element);
  element.isfav = false;
  notifyListeners();
  }


}