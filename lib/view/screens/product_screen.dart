import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/products.dart';
import '../../viewmodel/Product.dart';
import '../Widgets/product_w.dart';




class SelectProduct extends StatefulWidget {
  const SelectProduct({Key? key}) : super(key: key);
  @override
  State<SelectProduct> createState() => _SelectProductState();
}
var productNo;

getproduct(index){
productNo = index;
}


class _SelectProductState extends State<SelectProduct> {

  @override
  Widget build(BuildContext context) {
    final datap = Provider.of<Data>(context);
    datap.fetchData();
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
                child: Consumer<Data>(
                    builder: (context, datap, child){
                      return singleproduct(productNo, context, datap);
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




