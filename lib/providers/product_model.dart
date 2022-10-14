import 'package:flutter/material.dart';


  class Catalog{
  int id;
  String price;
  String image;
  String title;
  String rating;
  String desc;
  bool isincart;
  bool isfav;

  Catalog({required this.id,
  required this.title,
  required this.price,
  required this.image,
  required this.rating,
  required this.desc,
  this.isincart = false,
  this.isfav = false,

  });


  factory Catalog.fromJson(Map<String,dynamic> json){
  return Catalog(id: json['id'],title: json['title'], price: json['price'].toString(), rating: json['rating']['rate'].toString(), image: json['image'], desc: json['description']);
  }


  }





