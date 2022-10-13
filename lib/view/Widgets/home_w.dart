
import 'package:app1/view/Widgets/login_w.dart';
import 'package:app1/view/screens/cart_screen.dart';
import 'package:app1/viewmodel/home.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../screens/login_screen.dart';
import '../screens/product_screen.dart';
import 'package:provider/provider.dart';

Widget buildappbar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children: [
        Container(
          transform: Matrix4.translationValues(
              MediaQuery.of(context).size.width * -0.03, 0, 0),
          child: TextButton(
            //logout button
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('uname');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext ctx) => const MyLoginPage()));
            },
            child: Transform.rotate(
              angle: 180 * math.pi / 180,
              child: const Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
            ),
          ),
        ),
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
  );
}

Widget nodata() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildproducts(context, snapshot) {

  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: MediaQuery.of(context).size.width * 0.04,
      childAspectRatio: MediaQuery.of(context).size.width * 0.0023,
      crossAxisSpacing: MediaQuery.of(context).size.width * 0.04,
    ),
    itemCount: snapshot.data?.length,
    itemBuilder: (ctx, index) => GestureDetector(
      onTap: () {
        Map<String, String> prods = Map();
        prods['product_img'] = snapshot.data[index].image;
        prods['product_name'] = snapshot.data[index].title;
        prods['product_price'] = snapshot.data[index].price;
        prods['rating'] = snapshot.data[index].rating;
        prods['desc'] = snapshot.data[index].desc;

        getproduct(prods);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext ctx) => const SelectProduct()));
      },
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
       elevation: 15,
        child: Column(
          children: [
            //Product image
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: getimage(snapshot, index, context),
                ),
                Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * -0.06,
                      MediaQuery.of(context).size.height * -0.01,
                      0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    label: Text(""),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 2),
              child: getname(snapshot, index, context),
            ),
            //Products Price

            Container(
              margin: EdgeInsets.all(6),
              child: getprice(snapshot, index, context),
            ),

            //Product name
          ],
        ),
      ),
    ),
  );
}
