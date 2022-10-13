import 'package:provider/provider.dart';
import 'package:app1/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

        return MaterialApp(
          title: 'MyShop',
          theme: ThemeData(primarySwatch: Colors.grey),
          home: Splash(),
          debugShowCheckedModeBanner: false,
        );

  }
}



