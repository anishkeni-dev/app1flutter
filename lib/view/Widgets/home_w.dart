
import 'package:app1/providers/product_model.dart';
import 'package:app1/viewmodel/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import '../../providers/products.dart';
import '../screens/login_screen.dart';
import '../screens/product_screen.dart';





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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext ctx) => const MyCart()));
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

class Catalogbuilder extends StatefulWidget {
  const Catalogbuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<Catalogbuilder> createState() => _CatalogbuilderState();
}

class _CatalogbuilderState extends State<Catalogbuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final data = Provider.of<Catalog>(context, listen: true);
    // data.addtowishlist();
  }
  @override
  Widget build(BuildContext context) {
    final datap =  Provider.of<Data>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: MediaQuery.of(context).size.width * 0.04,
        childAspectRatio: MediaQuery.of(context).size.width * 0.0023,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.04,
      ),
      itemCount: datap.dataModel.length,
      itemBuilder: (ctx, index) =>GestureDetector(
        onTap: () {
          getproduct(datap.dataModel[index].id);
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
                    child: getimage(datap, index),
                  ),
                  Container(
                    transform: Matrix4.translationValues(
                        MediaQuery.of(context).size.width * -0.06,
                        MediaQuery.of(context).size.height * -0.01,
                        0),
                    child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          datap.dataModel[index].addtowishlist();
                        });

                        },
                      icon: Icon(datap.dataModel[index].isfav?Icons.favorite : Icons.favorite_border),
                      label: Text(""),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 2),
                child: getname( datap , index),
              ),
              //Products Price

              Container(
                margin: EdgeInsets.all(6),
                child: getprice(datap,  index),
              ),

              //Product name
            ],
          ),
        ),
      ),

    );
  }
}

