import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app1/view/screens/home_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Future <dynamic> readJson(uname,pswd,context) async {
  List _user = [];
  final String response = await DefaultAssetBundle.of(context).loadString("assets/response.json");
  final data = jsonDecode(response);
  _user = data['User'];
  //If user does not exist!
  if(_user[0]['username'] != uname && _user[0]['password'] != pswd) {
    return showTopSnackBar(
      context,
      const CustomSnackBar.error(
        message: "User not found! Please Sign-up"
      ),
    );

  }
  //user exists
  else {
         //login successful
         if (_user[0]['username'] == uname && _user[0]['password'] == pswd) {
          await Future.delayed(const Duration(milliseconds: 1500), () {});
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()));
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('uname', uname);

        }
       // incorrect credentials
       else{
            if(_user[0]['username'] != uname) {
              return showTopSnackBar(
                context,
                const CustomSnackBar.error(
                    message: 'Incorrect Username! Please try again'
                ),
              );
            }
            else{
              return showTopSnackBar(
                context,
                const CustomSnackBar.error(
                    message: 'Incorrect Password! Please try again'
                ),
              );
            }
        }
      }
}
