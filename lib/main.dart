import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kingston/adminLogin.dart';
import 'package:kingston/dashboard.dart';
import 'package:kingston/findPastPapers.dart';
import 'package:kingston/login.dart';
import 'package:kingston/pastpaperList.dart';
import 'package:kingston/removePastpapers.dart';
import 'package:kingston/signupScreen.dart';
import 'package:kingston/splashScreen.dart';
import 'package:kingston/uploadPastPapers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashScreen()
    );
  }
}

void navigatetoDash(BuildContext context){
//  Future.delayed(Duration(seconds: 2));
  Navigator.push(context, MaterialPageRoute(builder:(context) => dashboardScreen(), ));
}

