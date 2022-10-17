import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app1/providers/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/api/product_api.dart';
import 'package:flutter/material.dart';

import '../model/product_repo.dart';
import '../view/screens/product_screen.dart';

class Data extends ChangeNotifier{

  late List<Catalog> dataModel= [];

  fetchData() async{

    dataModel = await getData();
    notifyListeners();
  }



}



