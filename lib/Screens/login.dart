import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:app1/Screens/home.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();


}

class _MyLoginPageState extends State<MyLoginPage> {

  final ucontroller = TextEditingController();
  final pcontroller = TextEditingController();

  String uname = '';
  String pswd = '';
  bool isloggedin = false;

  List _user= [];
  // Fetch content from the json file
  Future <void> readJson(uname,pswd) async {
    final String response = await DefaultAssetBundle.of(context).loadString("assets/response.json");
    final data = jsonDecode(response);
    _user = data['User'];
    setState(() async {

      if (_user[0]['username'] == uname && _user[0]['password'] == pswd) {

        await Future.delayed(Duration(milliseconds: 1500), () {});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));

        isloggedin = true;
      }
      else {
        Container(
          child: Text("invalid", style: TextStyle(color: Colors.white),),
        );
      }
    }
    );
  }


    @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/frame1login.png') ,fit: BoxFit.cover),
        ),


      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(

          child:
             Center(
               child: Column(

                        children:
                          <Widget>[

                           Container(
                             transform: Matrix4.translationValues(0, 70, 0),
                             child:
                             Image.asset('images/logo.png',
                               scale: 2.2,
                             ),
                           ),

                            Container(

                              margin:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.12,),
                              child:
                              AutoSizeText(

                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                    fontSize: 35.0,

                                ),

                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.8,
                              margin:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06,
                              ),
                            child: TextFormField(

                                  style: TextStyle(color: Colors.white), //<-- SEE HERE
                                  controller: ucontroller,
                                    decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(

                            width: MediaQuery.of(context).size.width*0.8,
                            child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  controller: pcontroller,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  )
                              ),
                            ),
                          ),
                            Container(
                              padding: EdgeInsets.all(18),
                              child: Text('Forgot Password?', style: TextStyle(color: Colors.white)
                                ,),
                            ),

                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                              ),
                              onPressed:() async{

                                readJson(ucontroller.text,pcontroller.text);

                                final SharedPreferences prefs = await SharedPreferences.getInstance() ;
                                prefs.setString('uname', ucontroller.text);
                                Get.to(MyLoginPage());

                              }
                              ,child: Text('Sign in'),
                          ),
                            Container(
                              padding: EdgeInsets.all(18),
                              child: Text('New User? Sign Up', style: TextStyle(color: Colors.white)),
                            )





      ]
                      ),
             ),


                ),



        ),

    );
  }
}




















