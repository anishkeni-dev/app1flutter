import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

getproductimg(products, context) {
  return Container(
   transform: Matrix4.translationValues(
       MediaQuery.of(context).size.width * 0.10, 0, 0),
    child: FadeInImage.assetNetwork(
     image: products['product_img'], placeholder: 'products',

      ),
    );
}

getproductname(products, context) {
  return AutoSizeText(
    products['product_name'],
    maxFontSize: 60,
    minFontSize: 18,
  );
}

getproductprice(products, context) {
  return AutoSizeText(
    "\$" + products['product_price'],
    maxFontSize: 50,
    minFontSize: 20,
  );
}

getproductdesc(products, context) {
  return AutoSizeText(
     products['desc'],
    maxFontSize: 50,
    minFontSize: 20,
  );
}
