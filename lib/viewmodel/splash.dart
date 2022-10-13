import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:app1/view/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/screens/login_screen.dart';

var obtaineduname;

List user = [];

  Future getValidationData(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    obtaineduname = prefs.getString('uname');

  }



  validatelogin(context ) async {

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

  }

