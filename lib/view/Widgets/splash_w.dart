import 'package:app1/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';


getsplash(context) {
  return Center(
    child: Container(
      child: SplashScreenView(
        navigateRoute: const MyLoginPage(),
        imageSrc: "images/logo.png",
        // paddingText
        // paddingLoading
      ),



      ),
  );
}