import 'package:app1/model/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Catalog>> getData() async {
  List<Catalog> dataModel = [];
  final response =
  await http.get(Uri.parse('https://fakestoreapi.com/products'));
  var responseData = json.decode(response.body);
  for(var i = 0; i< responseData.length; i++) {
    Catalog prods = Catalog.fromJson(responseData[i]);
    dataModel.add(prods);

  }
  return dataModel;


}