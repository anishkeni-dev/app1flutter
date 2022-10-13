import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../view/Widgets/home_w.dart';

getproductimg(loadedproduct,context) {
  return Container(
   transform: Matrix4.translationValues(
       MediaQuery.of(context).size.width * 0.10, 0, 0),
    child:
    FadeInImage.assetNetwork(
           image: loadedproduct.image, placeholder: 'products',
          ),

    );
}

getproductname(loadedproduct) {
  return AutoSizeText(
    loadedproduct.title,
    maxFontSize: 60,
    minFontSize: 18,
  );
}

getproductprice(loadedproduct) {
  return AutoSizeText(
    "\$" +   loadedproduct.price,
    maxFontSize: 50,
    minFontSize: 20,
  );
}

getproductdesc(loadedproduct) {
  return AutoSizeText(
    loadedproduct.desc,
    maxFontSize: 50,
    minFontSize: 20,
  );
}
