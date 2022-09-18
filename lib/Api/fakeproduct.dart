import 'package:app1/models/products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Product>> getRequest() async {
  //replace your restFull API here.
  final response = await http.get(Uri.https('fakestoreapi.com','products'));
  var responseData = json.decode(response.body);
  //Creating a list to store input data;
  List<Product> products = [];
  for (var singleProduct in responseData) {
    Product prods = Product(
      id: singleProduct["id"],
      title: singleProduct["title"],
      price: singleProduct["price"].toString(),
      image: singleProduct["image"],
    );

    //Adding Product to the list.
    products.add(prods);
  }
  return products;
}