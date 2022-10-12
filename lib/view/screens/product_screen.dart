import 'package:flutter/material.dart';
import '../../viewmodel/Product.dart';
import '../Widgets/product_w.dart';




class SelectProduct extends StatefulWidget {
  const SelectProduct({Key? key}) : super(key: key);
  @override
  State<SelectProduct> createState() => _SelectProductState();
}

Map<String, String> products = Map();
getproduct(prods){
products = prods;
}


class _SelectProductState extends State<SelectProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                child: singleproduct(products, context),
              ),
            ),
          ],
        ),

      ),
    );
  }
}




