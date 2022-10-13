import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

getproductimg(productNo, context,datap) {
  return Container(
   transform: Matrix4.translationValues(
       MediaQuery.of(context).size.width * 0.10, 0, 0),
    child: FadeInImage.assetNetwork(
     image: datap.dataModel[productNo].image, placeholder: 'products',
      ),
    );
}

getproductname(productNo, context,datap) {
  return AutoSizeText(
    datap.dataModel[productNo].title,
    maxFontSize: 60,
    minFontSize: 18,
  );
}

getproductprice(productNo, context,datap) {
  return AutoSizeText(
    "\$" +   datap.dataModel[productNo].price,
    maxFontSize: 50,
    minFontSize: 20,
  );
}

getproductdesc(productNo, context,datap) {
  return AutoSizeText(
    datap.dataModel[productNo].desc,
    maxFontSize: 50,
    minFontSize: 20,
  );
}
