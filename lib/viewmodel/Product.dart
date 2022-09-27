import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

getproductimg(products, context) {
  return Image.network(
    products['product_img'],
    height: MediaQuery.of(context).size.height * 0.5,
    width: MediaQuery.of(context).size.height * 0.5,
  );
}

getproductname(products, context) {
  return AutoSizeText(
    products['product_name'],
    style: TextStyle(color: Colors.white),
    maxFontSize: 50,
    minFontSize: 20,
  );
}

getproductprice(products, context) {
  return AutoSizeText(
    "\$" + products['product_price'],
    style: TextStyle(color: Colors.white),
    maxFontSize: 50,
    minFontSize: 20,
  );
}

getproductdesc(products, context) {
  return AutoSizeText(
    "Description: " + products['desc'],
    style: TextStyle(color: Colors.white),
    maxFontSize: 50,
    minFontSize: 20,
  );
}
