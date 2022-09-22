import 'package:app1/model/products.dart';
import 'dart:convert';
import 'api/product_api.dart';


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
      rating: singleProduct["rating"]['rate'].toString(),
      desc: singleProduct["description"],
    );
    //Adding Product to the list.
    products.add(prods);
  }
  return products;
}