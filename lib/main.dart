import 'package:app1/UI/login_view.dart';
import 'package:app1/UI/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Flutter',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}



