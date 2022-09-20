import 'package:app1/model/products.dart';
import 'dart:convert';
import 'package:app1/model/services/product_service.dart';

Future<List<Product>> fetchproductlist() async {
  final response = await getRequest();
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