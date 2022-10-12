import 'package:flutter/material.dart';
import '../../model/product_repo.dart';
import '../../viewmodel/Product.dart';
import '../../viewmodel/Cart.dart';
import '../Widgets/cart_w.dart';
import '../Widgets/home_w.dart';
import '../Widgets/product_w.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);
  @override
  State<MyCart> createState() => _MyCartState();
}
Map<String, String> products = Map();
getcart(prods){
  products = prods;
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: productappbar(context),
        ),
        body:
        Column(
          children: [
            Expanded(
              child:SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: FutureBuilder(
                  future: fetchproductlist(),
                  builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return nodata();

                    } else {
                      print(products);
                      return
                        Showcart(ctx, products);
                    }
                  },
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}




