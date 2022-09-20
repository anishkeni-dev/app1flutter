import 'package:flutter/material.dart';
import 'package:app1/model/product_repo.dart';
import '../../view model/home_vm.dart';
import '../Widgets/home.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
         appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: buildappbar(),
         ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: fetchproductlist(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              return productview(ctx,snapshot);
            },
          ),
        ),
      ),
    );
  }
}
