import 'dart:io';

import 'package:app1/providers/product_model.dart';
import 'package:app1/view/Widgets/home_w.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:provider/provider.dart';
import '../../providers/products.dart';
import '../../viewmodel/Product.dart';
import '../Widgets/product_w.dart';
import 'cart_screen.dart';

class SelectProduct extends StatefulWidget {
  const SelectProduct({Key? key}) : super(key: key);
  @override
  State<SelectProduct> createState() => _SelectProductState();
}
var productNo;

getproduct(id){
productNo = id;
}


class _SelectProductState extends State<SelectProduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<Data>(context, listen: false);
    data.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final datap = Provider
        .of<Data>(context)
        .dataModel;
    final loadedproduct = Provider
        .of<Data>(context)
        .dataModel
        .firstWhere((prod) => prod.id == productNo);
    print(loadedproduct);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child:  AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [


              Container(
                transform: Matrix4.translationValues(
                    MediaQuery.of(context).size.width * 0.23, 0, 0),
                child: InvertColors(
                  child: Image.asset(
                    'images/logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * 0.52, 0, 0),
                  child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext ctx) => const MyCart()));
                      },
                      icon: Icon(Icons.shopping_cart_rounded,color: Colors.black),

                      label: Text(''))),
            ],
          ),
        ),
        ),
        body:
        Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Consumer<Data>(
                      builder: (context, datap, child) {
                        return Container(
                          child: Container(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    //image
                                    Container(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.38,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.38,
                                      color: Colors.white,
                                      transform: Matrix4.translationValues(
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.38, -20.2, 0),
                                      child: getproductimg(
                                          loadedproduct, context),
                                    ),
                                    Column(
                                      children: [
                                        //title
                                        Container(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.30,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.38,
                                          transform: Matrix4.translationValues(
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * -0.28, 0, 0),
                                          child: getproductname(loadedproduct),
                                        ),

                                        //rating

                                        Platform.isIOS
                                            ? Container(
                                          transform: Matrix4.translationValues(
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * -0.19, -70, 0),
                                          child: AutoSizeText(
                                            'Rating',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        )
                                            : Container(
                                          transform: Matrix4.translationValues(
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height * -0.2, -70, 0),
                                          child: AutoSizeText(
                                            'Rating',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        ),

                                        Platform.isIOS
                                            ? Container(
                                          transform: Matrix4.translationValues(
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * -0.01, -60, 0),
                                          child: Row(
                                            children: [
                                              AutoSizeText(
                                                loadedproduct.rating,
                                                //products['rating'],
                                                style: TextStyle(
                                                    color: Colors.black),
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
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * -0.01, -60, 0),
                                          child: Row(
                                            children: [
                                              AutoSizeText(
                                                loadedproduct.rating,
                                                style: TextStyle(
                                                    color: Colors.black),
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

                                        // price

                                        Platform.isIOS
                                            ? Container(
                                          transform: Matrix4.translationValues(
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * -0.42, -45, 0),
                                          child: AutoSizeText(
                                            'Price',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        )
                                            : Container(
                                          transform: Matrix4.translationValues(
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * -0.42, -45, 0),
                                          child: AutoSizeText(
                                            'Price',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        ),
                                        Platform.isIOS
                                            ? Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            transform: Matrix4
                                                .translationValues(
                                                MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * -0.01, -35, 0),
                                            child: getproductprice(
                                                loadedproduct),
                                          ),
                                        )
                                            : Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            transform: Matrix4
                                                .translationValues(
                                                MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * -0.01, -35, 0),
                                            child: getproductprice(
                                                loadedproduct),
                                          ),
                                        ),
                                        Container(
                                          transform: Matrix4.translationValues(
                                              MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * -0.41, -20, 0),
                                          child: AutoSizeText(
                                            'Colors',
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                transform: Matrix4
                                                    .translationValues(
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * -0.01, -10, 0),
                                                width: 20,
                                                height: 20,
                                                child: const DecoratedBox(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                transform: Matrix4
                                                    .translationValues(
                                                    MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width * -0.01, -10, 0),
                                                width: 20,
                                                height: 20,
                                                child: const DecoratedBox(
                                                  decoration: const BoxDecoration(
                                                      color: Colors.black),
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
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 1,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(30.0))),
                                      backgroundColor: MaterialStatePropertyAll<
                                          Color>(Colors.black87),
                                    ),
                                    child: AutoSizeText(
                                      'Buy Now',
                                      minFontSize: 20,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.02,
                                ),
                                Container(
                                  height: 40,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * 1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      datap.addtocart(loadedproduct);
                                      setState(() {});
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 1),
                                              borderRadius: BorderRadius
                                                  .circular(30.0))),
                                      backgroundColor: MaterialStatePropertyAll<
                                          Color>(Colors.white),
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
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * -0.34, 0, 0),

                                    child: AutoSizeText("Description ",
                                      style: TextStyle(color: Colors.black45),
                                      minFontSize: 15,)
                                )
                                    : Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    transform: Matrix4.translationValues(
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width * -0.35, 0, 0),

                                    child: AutoSizeText("Description ",
                                      style: TextStyle(color: Colors.black45),
                                      minFontSize: 15,)
                                ),
                                getproductdesc(loadedproduct),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                )
            ),

          ],
        ),

      ),
    );
  }

}