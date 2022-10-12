
import 'package:flutter/material.dart';
class Catalog with ChangeNotifier{
  int id;
  String price;
  String image;
  String title;
  String rating;
  String desc;

  Catalog({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.desc,
  }
  );
}