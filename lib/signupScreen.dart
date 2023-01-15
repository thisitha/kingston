import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'findPastPapers.dart';
import 'login.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff04045b),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style:  TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintText: 'Username',
                  hintStyle:  TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style:  TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintStyle:  TextStyle(color: Colors.white),
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                style:  TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle:  TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style:  TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintStyle:  TextStyle(color: Colors.white),
                  hintText: 'Batch',
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen(),));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                      style: TextStyle(color: Colors.black),
                      "Register"
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
