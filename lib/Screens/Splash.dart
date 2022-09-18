import 'dart:async';
import 'package:app1/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:app1/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

var obtaineduname;
List user = [];
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override

  void initState(){
    getValidationData().whenComplete(()  async {
      final String response = await DefaultAssetBundle.of(context).loadString(
          "assets/response.json");
      final data = jsonDecode(response);
      user = data['User'];

      if (user[0]['username'] == obtaineduname) {
        await Future.delayed(Duration(milliseconds: 1500), () {});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        print("###############################################\n\n\n\nuser $obtaineduname exsits");
      }
      else {
        await Future.delayed(Duration(milliseconds: 1500), () {});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyLoginPage()));
        print("###############################################\n\n\n\nNew user");
      }
    });

        super.initState();
  }



  Future getValidationData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  obtaineduname = prefs.getString('uname')!;

  setState(() {

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(
            transform: Matrix4.translationValues(150.0, 320.0, 0.0),
            child: Text('Anish Keni',
                style: TextStyle(color: Colors.black,
                    fontSize:23)
            ),
          ),



      );

  }
}


