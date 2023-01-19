import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'findPastPapers.dart';
import 'main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    String? userId  = FirebaseAuth.instance.currentUser?.uid.toString();
    if(userId!=null){
      Timer(
          Duration(seconds: 1),
              () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => findPastPapers())
              )
      );
    }else{
      Timer(
          Duration(seconds: 1),
              () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => dashboardScreen())
              )
      );
    }

   // isUserLogged(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
                height: 200,
                child: Image.asset("assets/kingston.png")),
            //CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}



void isUserLogged(BuildContext context){
  String? userId  = FirebaseAuth.instance.currentUser?.uid.toString();
  if(userId!=null){
    Navigator.push(context, MaterialPageRoute(builder:(context) => findPastPapers(), ));
  }
}

