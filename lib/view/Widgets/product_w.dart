import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/Product.dart';

productappbar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.black,
    title: Row(
      children: [
        Container(
          transform: Matrix4.translationValues(
              MediaQuery.of(context).size.width * -0.18, 0, 0),
          child: TextButton(
            //logout button
            onPressed: () {},
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
        ),
        Container(
            transform: Matrix4.translationValues(
                MediaQuery.of(context).size.width * 0.5, 0, 0),
            child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: Text(''))),
      ],
    ),
  );
}

singleproduct(products, context) {
  return Container(
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.38,
              width: MediaQuery.of(context).size.width * 0.38,
              color: Colors.white,
              transform: Matrix4.translationValues(
                  MediaQuery.of(context).size.width * 0.38, -20.2, 0),
              child: getproductimg(products, context),
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.38,
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * -0.28, 0, 0),
                  child: getproductname(products, context),
                ),
                Platform.isIOS
                ?Container(
                    transform: Matrix4.translationValues(
                    MediaQuery.of(context).size.height * -0.19, -70, 0),
                    child: AutoSizeText(
                    'Rating',
                    style: TextStyle(color: Colors.black45),
                    ),
                )
                :Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.height * -0.2, -70, 0),
                  child: AutoSizeText(
                    'Rating',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Platform.isIOS
                    ? Container(
                        transform: Matrix4.translationValues(
                        MediaQuery.of(context).size.width * -0.01, -60, 0),
                        child: Row(
                        children: [
                        AutoSizeText(
                        products['rating'],
                        style: TextStyle(color: Colors.black),
                        maxFontSize: 50,
                        minFontSize: 20,
                        ),
                        Icon(
                        Icons.star_half_outlined,
                        color: Colors.amberAccent,
                        ),
                        ],
                        ),
                        )
                    : Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * -0.01, -60, 0),
                  child: Row(
                    children: [
                      AutoSizeText(
                        products['rating'],
                        style: TextStyle(color: Colors.black),
                        maxFontSize: 50,
                        minFontSize: 20,
                      ),
                      Icon(
                        Icons.star_half_outlined,
                        color: Colors.amberAccent,
                      ),
                    ],
                  ),
                ),
                Platform.isIOS
                    ?Container(
                      transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * -0.42, -45, 0),
                      child: AutoSizeText(
                      'Price',
                      style: TextStyle(color: Colors.black45),
                      ),
                      )
                    : Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * -0.42, -45, 0),
                  child: AutoSizeText(
                    'Price',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Platform.isIOS
                ?Container(
                  transform: Matrix4.translationValues(
                  MediaQuery.of(context).size.width * -0.37, -35, 0),
                  child: getproductprice(products, context),
                  )
                :Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * -0.37, -35, 0),
                  child: getproductprice(products, context),
                ),
                Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * -0.41, -20, 0),
                  child: AutoSizeText(
                    'Colors',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        transform: Matrix4.translationValues(
                            MediaQuery.of(context).size.width * -0.01, -10, 0),
                        width: 20,
                        height: 20,
                        child: const DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        transform: Matrix4.translationValues(
                            MediaQuery.of(context).size.width * -0.01, -10, 0),
                        width: 20,
                        height: 20,
                        child: const DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 1,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.black87),
            ),
            child: AutoSizeText(
              'Buy Now',
              minFontSize: 20,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 1,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(30.0))),
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
            ),
            child: AutoSizeText(
              'Add to cart',
              minFontSize: 20,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Platform.isIOS
            ? Container(
                    margin: EdgeInsets.only(bottom: 10),
              transform: Matrix4.translationValues(
              MediaQuery.of(context).size.width * -0.34, 0, 0),

              child: AutoSizeText("Description ", style: TextStyle(color: Colors.black45),
              minFontSize: 15,)
              )
            : Container(
          margin: EdgeInsets.only(bottom: 10),
          transform: Matrix4.translationValues(
              MediaQuery.of(context).size.width * -0.35, 0, 0),

          child: AutoSizeText("Description ", style: TextStyle(color: Colors.black45),
          minFontSize: 15,)
        ),
        getproductdesc(products, context),
      ],
    ),
  );
}
