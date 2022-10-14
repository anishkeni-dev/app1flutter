import 'package:flutter/material.dart';

class Catalog with ChangeNotifier {
  int id;
  String price;
  String image;
  String title;
  String rating;
  String desc;
  bool isfav;
  Catalog({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.desc,
    required this.isfav,
  });
  factory Catalog.fromJson(Map<String, dynamic> json) {
    return Catalog(
        id: json['id'],
        title: json['title'],
        price: json['price'].toString(),
        rating: json['rating']['rate'].toString(),
        image: json['image'],
        desc: json['description'],
        isfav: false,
        );

  }

  void addtowishlist(){
    isfav = !isfav;
    notifyListeners();
  }
}
