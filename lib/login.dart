import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingston/findPastPapers.dart';

TextEditingController userNameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
                    "Login With Us",
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
                controller: userNameController,
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
                controller: passwordController,
                style:  TextStyle(color: Colors.white),
                decoration: new InputDecoration.collapsed(
                  hintStyle:  TextStyle(color: Colors.white),
                    hintText: 'Password',
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                loginUser(userNameController.text, passwordController.text,context);
                 //Navigator.push(context, MaterialPageRoute(builder: (context) => findPastPapers(),));
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

Future<void> loginUser(String email, String password,BuildContext context) async {
  print("method called");
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    if(credential.user?.uid!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => findPastPapers(),));
      print(credential.user?.uid.toString());
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}