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
    final loadedproduct = Provider.of<Data>(context).dataModel.firstWhere((prod) => prod.id == productNo);
    print(loadedproduct);
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
                      return singleproduct(loadedproduct,context);
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




