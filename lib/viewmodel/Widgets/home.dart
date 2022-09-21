import 'package:app1/view/screens/home_view.dart';
import 'package:app1/view/screens/login_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget buildappbar(context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'images/logo.png',
            width: 50,
            height: 50,
          ),
        ),
        Container(
          transform: Matrix4.translationValues(250, 0, 0),
          child: TextButton(
            //logout button
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('uname');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext ctx) => MyLoginPage()));
            },
            child: Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget nodata() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
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
      onTap: () {},
      child: Card(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Image.network(
                snapshot.data[index].image,
                width: 120,
                height: 120,
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: AutoSizeText(
                  snapshot.data[index].title,
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: AutoSizeText("\$" + snapshot.data[index].price)),
          ],
        ),
      ),
    ),
  );
}


