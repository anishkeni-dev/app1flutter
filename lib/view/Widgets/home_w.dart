
import 'package:app1/view/Widgets/login_w.dart';
import 'package:app1/viewmodel/home.dart';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import '../screens/login_screen.dart';
import '../screens/product_screen.dart';



Widget buildappbar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children: [
        Container(
          child:TextButton(
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
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          transform: Matrix4.translationValues(MediaQuery.of(context).size.width*0.59, 0, 0),
          child: Image.asset(
            'images/logo.png',
            width: 50,
            height: 50,
          ),
        ),
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
      childAspectRatio: MediaQuery.of(context).size.width * 0.002,
      crossAxisSpacing: MediaQuery.of(context).size.width * 0.04,
    ),
    itemCount: snapshot.data.length,
    itemBuilder: (ctx, index) => GestureDetector(
      onTap: (){
        Map<String,String> prods = Map();
        prods ['product_img'] = snapshot.data[index].image;
        prods['product_name'] = snapshot.data[index].title;;
        prods['product_price']= snapshot.data[index].price;
        prods['rating'] = snapshot.data[index].rating;
        prods['desc'] = snapshot.data[index].desc;

        getproduct(prods);
        Navigator.push( context,
            MaterialPageRoute(
                builder: (BuildContext ctx) => const SelectProduct()));
      },
      child: Card(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: getimage(snapshot, index, context),
            ),
            Divider(
              thickness: 0.5, // thickness of the line
              indent: 0, // empty space to the leading edge of divider.
              endIndent: 0, // empty space to the trailing edge of the divider.
              color: Colors.black54, // The color to use when painting the line.
              height: 10, // The divider's height extent.
            ),
            Container(
                margin: const EdgeInsets.all(8),
                child: getname(snapshot, index, context),
            ),
            Container(
                margin: const EdgeInsets.only(
                  top:0,
                ),
                child:getprice(snapshot, index, context),
            ),
          ],
        ),
      ),
    ),
  );
}

