import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app1/providers/product_model.dart';

import '../model/api/product_api.dart';
import 'package:flutter/material.dart';

import '../model/product_repo.dart';

class WishlistProvider extends ChangeNotifier{

  late List<Catalog> WishlistModel= [];

  fetchData() async{

    WishlistModel = await getData();
    notifyListeners();
  }

}



