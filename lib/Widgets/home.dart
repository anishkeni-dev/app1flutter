import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:app1/UI/home_view.dart';

Widget buildappbar(){
  return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child:
        Image.asset('images/logo.png',
          width: 50,
          height: 50,
        ),
        ),
      );
}
Widget nodata(){
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget buildproducts(context, snapshot){
  return GridView.builder(

    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: MediaQuery.of(context).size.width*0.002,
    crossAxisSpacing: MediaQuery.of(context).size.width*0.04,


    ),
    itemCount: snapshot.data.length,
    itemBuilder: (ctx, index) => Card(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Image.network(snapshot.data[index].image, width: 120, height: 120,
              ),
            ),
            Container(
                margin:EdgeInsets.all(10),
                child: AutoSizeText(snapshot.data[index].title, overflow: TextOverflow.ellipsis,)
            ),
            Container(
                margin:EdgeInsets.only(top: 10,),
                child: AutoSizeText("\$" + snapshot.data[index].price)
            ),

          ],
        ),

    ),
  );
}