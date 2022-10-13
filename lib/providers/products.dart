import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app1/model/product_model.dart';

import '../model/api/product_api.dart';
import 'package:flutter/material.dart';

import '../model/product_repo.dart';

class Data extends ChangeNotifier{

  late List<Catalog> dataModel= [];

  fetchData() async{

    dataModel = await getData();

    notifyListeners();
  }

}

