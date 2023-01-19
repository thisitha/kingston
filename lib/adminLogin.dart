import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingston/removePastpapers.dart';
import 'package:kingston/uploadPastPapers.dart';

import 'findPastPapers.dart';
TextEditingController adminUsernameController = new TextEditingController();
TextEditingController adminPasswordController = new TextEditingController();
class adminLoginScreen extends StatefulWidget {
  const adminLoginScreen({Key? key}) : super(key: key);

  @override
  State<adminLoginScreen> createState() => _adminLoginScreenState();
}

class _adminLoginScreenState extends State<adminLoginScreen> {
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
                  "Admin Login",
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
                controller: adminUsernameController,
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
                controller: adminPasswordController,
                style:  TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintStyle:  TextStyle(color: Colors.white),
                  hintText: 'Password',
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                validateAdmin(adminUsernameController.text,adminPasswordController.text,context);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                      style: TextStyle(color: Colors.black),
                      "Login"
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Future<void> validateAdmin(String email, String password, BuildContext context) async {
  try {
    final docRef = FirebaseFirestore.instance.collection("admin").doc("1");
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data["password"]);
       if(email==data["userName"]&&password==data["password"]){
         Navigator.push(context, MaterialPageRoute(builder: (context) => uploadpastpapers(),));
       }else{
         print("password Invalid");
       }
      },
      onError: (e) => print("Error getting document: $e"),
    );

  } catch (e) {
    print(e);
  }
}