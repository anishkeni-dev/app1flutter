import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

productappbar(context) {
  return SafeArea(
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
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
            child: Image.asset(
              'images/logo.png',
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    ),
  );
}

singleproduct(products, context) {
  return Container(
    child: Column(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              child: Image.network(
                products['product_img'],
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.height*0.5,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              products['product_name'],
              style: TextStyle(color: Colors.white),
              maxFontSize: 50,
              minFontSize: 20,

            ),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                AutoSizeText("Rating: " +
                    products['rating'],
                  style: TextStyle(color: Colors.white),
                  maxFontSize: 50,
                  minFontSize: 20,

                ),
                Icon(Icons.star_half_outlined, color: Colors.amberAccent,),
              ],
            ),

          ),

          SizedBox(height: 15,),
          Align(
            alignment: Alignment.topLeft,
            child: AutoSizeText("\$" +
              products['product_price'],
              style: TextStyle(color: Colors.white),
              maxFontSize: 50,
              minFontSize: 20,

            ),
          ),
          SizedBox(height: 10,),
          SizedBox(height: 40,
            width: MediaQuery.of(context).size.width*1,
            child:  ElevatedButton(onPressed:(){},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),

              child: AutoSizeText('Buy Now', minFontSize: 20, style: TextStyle(color: Colors.black),),
               ),

          ),
          Divider(
            thickness: 1, // thickness of the line
            indent: 0, // empty space to the leading edge of divider.
            endIndent: 0, // empty space to the trailing edge of the divider.
            color: Colors.white, // The color to use when painting the line.
            height: 30, // The divider's height extent.
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.topLeft,
            child: AutoSizeText("Description: " +
                products['desc'],
              style: TextStyle(color: Colors.white),
              maxFontSize: 50,
              minFontSize: 20,
            ),
          ),

        ],

    ),
  );
}
