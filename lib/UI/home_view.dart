import 'package:flutter/material.dart';
import 'package:app1/Api/fakeproduct.dart';
import 'package:app1/Widgets/home.dart';

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
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return nodata();

              } else {
                  return  buildproducts(ctx, snapshot);

              }
            },
          ),
        ),
      ),
    );
  }
}
