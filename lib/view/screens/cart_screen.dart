// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:app1/providers/product_model.dart';
import 'package:app1/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/commmon.dart';
import '../../providers/cart_provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}



var totalprice ;

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<Data>(context, listen: false);
    data.fetchData();
  }

  @override
//displaying details in cart
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      bottomNavigationBar: Container(child: Text(cart.carttotal.toString()),),
      appBar: AppBar(
        title: Text("Cart"),

      ),

      body: Consumer<Data>(builder: (context,cartp, child) {
        return ListView.builder(
            itemCount: cart.cartlistbyid.length,
            itemBuilder: (context,index) {
              return Column(
                children: [
                  Image.network(
                    cart.cartlistbyid[index].image,
                    width: 100,
                    height: 100,
                  ),
                  Text(cart.cartlistbyid[index].title),
                  Text(cart.cartlistbyid[index].price),
                  Text(cart.cartlistbyid[index].id.toString()),
                  //removefromcart
                  ElevatedButton(
                      onPressed: (){
                    cart.removefromcart(cart.cartlistbyid[index]);
                    setState(() {

                    });
                  }, child: Icon(Icons.remove_circle_outline))
                ],
              );
            }
        );
      }
      ),

    );
  }
}
