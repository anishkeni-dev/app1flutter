
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


getproductname_price(products, context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    color: Colors.black,
    child: Row(
      children: [
    Image.network(
    products['product_img'],
      height: MediaQuery.of(context).size.height *0.11,
      width: MediaQuery.of(context).size.height * 0.11,
    ),
        SizedBox(width: 8,),
        Container(
          decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.greenAccent, width: 5),
          ),
        ),
          width: MediaQuery.of(context).size.width * 0.63,
          child: Column(
            children: [
              AutoSizeText(
                  products['product_name'],
                  style: TextStyle(color: Colors.white),
                  maxFontSize: 50,
                  minFontSize: 20,
                  // overflow: TextOverflow.clip,
                ),
               SizedBox(height: 20,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(
                    "\$" + products['product_price'],
                    style: TextStyle(color: Colors.white),
                    maxFontSize: 50,
                    minFontSize: 20,
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );

}