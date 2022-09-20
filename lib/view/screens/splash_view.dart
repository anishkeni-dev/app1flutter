import 'package:flutter/material.dart';

import '../Widgets/splash.dart';

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
      body:
          Center(
            child: Container(
              child: Text('Anish Keni',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:23)
              ),
            ),
          ),
      );
  }
}


