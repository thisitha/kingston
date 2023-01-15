import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingston/adminLogin.dart';
import 'package:kingston/login.dart';
import 'package:kingston/signupScreen.dart';

class dashboardScreen extends StatefulWidget {
  const dashboardScreen({Key? key}) : super(key: key);

  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff04045b),
      body: Container(
        //color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen(),));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width/3,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Student Login"
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signupScreen(),));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width/3,
                    color: Color(0xff007aff),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Student Register"
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => adminLoginScreen(),));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width/3,
                  color: Color(0xff0b32c5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "CMS Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
