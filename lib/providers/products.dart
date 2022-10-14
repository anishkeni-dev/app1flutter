import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app1/providers/product_model.dart';

import '../model/api/product_api.dart';
import 'package:flutter/material.dart';

import '../model/product_repo.dart';

class Data extends ChangeNotifier{
 bool isfav = false;
  late List<Catalog> dataModel= [];

  fetchData() async{

    dataModel = await getData();


    notifyListeners();
  }
 late List<Catalog> cartlistbyid = [];
 late List<Catalog> wishlistbyid = [];
 late double carttotal = 0;

 addtocart(element){
   cartlistbyid.add(element);
   var productprice = double.parse(element.price);
   carttotal = carttotal +  productprice;
   element.isincart= true;
   notifyListeners();
 }
 removefromcart(element){
   cartlistbyid.remove(element);
   element.isincart = false;
   var productprice = double.parse(element.price);
   carttotal = carttotal - productprice;
   notifyListeners();
 }
 addtowishlist(element){
   wishlistbyid.add(element);
   element.isincart= true;
   notifyListeners();
 }
 removefromwishlist(element){
   wishlistbyid.remove(element);
   element.isincart = false;
   notifyListeners();
 }

}



