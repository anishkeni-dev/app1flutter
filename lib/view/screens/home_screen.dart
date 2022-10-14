import 'package:app1/providers/product_model.dart';
import 'package:app1/view/screens/cart_screen.dart';
import 'package:app1/view/screens/wishlist.dart';
import 'package:app1/viewmodel/home.dart';
import 'package:flutter/material.dart';
import 'package:app1/model/product_repo.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../providers/products.dart';
import '../Widgets/home_w.dart';

import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<Data>(context, listen: false);
    data.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    final datap = Provider.of<Data>(context); // data provider for products
    return Scaffold(
        backgroundColor: HexColor("F2F2F2"),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: buildappbar(context),
        ),
        bottomNavigationBar:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: HexColor("0000"),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      label: '',
                    icon:
                      TextButton.icon(icon:Icon(Icons.layers_outlined),
                        label: Text('text')!,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (
                                      BuildContext ctx) => HomePage()));
                        },
                      ) ),
                  BottomNavigationBarItem(
                    label: '',
                      icon: TextButton.icon(icon:Icon(Icons.favorite),
                        label: Text('text')!,
                        onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (
                                    BuildContext ctx) => const MyWishlist()));
                      },
                      )),
                  BottomNavigationBarItem(
                      label: '',
                    icon:
                      TextButton.icon(icon:Icon(Icons.person),
                        label: Text('text')!,
                        onPressed: () {

                        },
                      ))
                ],
              ),
            ),
        ),
        body: Center(
            child: FutureBuilder(
                future: datap.fetchData(),
                builder: (BuildContext ctx,AsyncSnapshot) {
                  if (datap.dataModel.isEmpty) {
                    return nodata();
                  } else {
                    return  Consumer<Data>(
                    builder: (context, datap, child) {
                      return Catalogbuilder();
                    }
                    );
                  }
                },
              ),


        ),
      );

  }
}

