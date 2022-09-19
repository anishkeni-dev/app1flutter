import 'package:app1/Widgets/splash.dart';
import 'package:flutter/material.dart';

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


