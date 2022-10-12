import 'package:app1/model/product_model.dart';
import 'dart:convert';
import 'api/product_api.dart';

Future<List<Catalog>> fetchproductlist() async {
  final response = await getRequest();
  var responseData = json.decode(response.body);
  //Creating a list to store input data;
  List<Catalog> products = [];
  for (var singleProduct in responseData) {
    Catalog prods = Catalog(
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
