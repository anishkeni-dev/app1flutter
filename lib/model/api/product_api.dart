import 'package:app1/providers/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<dynamic> getRequest() async {
  //replace your restFull API here.
  final response = await http.get(Uri.https('fakestoreapi.com','products'));
  return response;
}



