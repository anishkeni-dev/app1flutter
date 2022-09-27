import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

getappbar(){
  return  AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
  );
}
getlogo(context){
  return Column(
    children: [
      Container(
             transform: Matrix4.translationValues(0, 70, 0),
             child: Image.asset(
              'images/logo.png',
               scale: 2.2,
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.12,
        ),
        child: const AutoSizeText(
          'Sign in',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
          ),
        ),
      ),
    ],
  );
}
getbackground(){
  return  BoxDecoration(
  image: DecorationImage(
  image: AssetImage('images/frame1login.png'), fit: BoxFit.cover),
  );
}
