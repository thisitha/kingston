import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'findPastPapers.dart';
import 'login.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController batchController = new TextEditingController();

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
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: batchController,
                style: TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Batch',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                userSignup(
                    emailController.text, passwordController.text,nameController.text,batchController.text, context);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen(),));
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:
                      Text(style: TextStyle(color: Colors.black), "Register"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> userSignup(String email, String password, String userName,String batch,BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user?.uid != null) {
       CollectionReference users = FirebaseFirestore.instance.collection('users');
      users.doc(userCredential.user?.uid).set({
        "userName": userName,
        "password":password,
        "batch":batch,
        "email":email
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => loginScreen(),
          ));
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
