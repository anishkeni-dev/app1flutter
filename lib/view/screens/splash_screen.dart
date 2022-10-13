
import 'package:flutter/material.dart';

import '../../viewmodel/splash.dart';
import '../Widgets/splash_w.dart';




class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override

  void initState(){
    getValidationData(context).whenComplete(() {
      return validatelogin(context);
    }
    );
    super.initState();

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getsplash(context),
      );
  }
}


