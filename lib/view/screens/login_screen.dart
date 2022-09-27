import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../viewmodel/login.dart';
import '../Widgets/login_w.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}


class _MyLoginPageState extends State<MyLoginPage> {
  final pcontroller = TextEditingController();
  final ucontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getbackground(),
      child: Scaffold(
        appBar: getappbar(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
               getlogo(context),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white), //<-- SEE HERE
                  controller: ucontroller,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white, width: 2),
                      )),
                ),
              ),

              const SizedBox(height: 20),
              //password
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child:  TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: pcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white, width: 2),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //submit button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10))),
                ),
                onPressed: () async {
                   setState(() {
                   readJson(ucontroller.text, pcontroller.text,context);
                   });
                },
                child: const Text('Sign in'),
              ),

              Container(
                padding: const EdgeInsets.all(18),
                child: const Text('New User? Sign Up',
                    style: TextStyle(color: Colors.white)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
