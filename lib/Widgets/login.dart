import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app1/UI/home_view.dart';

Future <dynamic> readJson(uname,pswd,context) async {
  List _user = [];

  final String response = await DefaultAssetBundle.of(context).loadString(
      "assets/response.json");
  final data = jsonDecode(response);
  _user = data['User'];
  if(_user[0]['username'] != uname && _user[0]['password'] != pswd) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:Text('User not found! Sign up now')));
  }

  else {
    if (_user[0]['username'] == uname && _user[0]['password'] == pswd) {
      await Future.delayed(Duration(milliseconds: 1500), () {});
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uname', uname);
    }

     else{
          if(_user[0]['username'] != uname) {
            return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Incorrect Username! Please try again')));
          }
          else{return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Incorrect Password! Please try again')));}
      }
}
}
