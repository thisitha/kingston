

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List<DropdownMenuItem<String>> batch = [
  DropdownMenuItem(child: Text("Batch 1"),value: ""),
  DropdownMenuItem(child: Text("Batch 2"),value: ""),
  DropdownMenuItem(child: Text("Batch 3"),value: ""),

];

List<DropdownMenuItem<String>> subject = [
  DropdownMenuItem(child: Text("Subject 1"),value: ""),
  DropdownMenuItem(child: Text("Subject 2"),value: ""),
  DropdownMenuItem(child: Text("Subject 3"),value: ""),

];

List<DropdownMenuItem<String>> year = [
  DropdownMenuItem(child: Text("2022"),value: ""),
  DropdownMenuItem(child: Text("2023"),value: ""),
  DropdownMenuItem(child: Text("2024"),value: ""),

];
class uploadpastpapers extends StatefulWidget {
  const uploadpastpapers({Key? key}) : super(key: key);

  @override
  State<uploadpastpapers> createState() => _uploadpastpapersState();
}

class _uploadpastpapersState extends State<uploadpastpapers> {

  @override
  Widget build(BuildContext context) {
    Future<void> pickFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path.toString());
        FirebaseStorage storage = FirebaseStorage.instance;
        storage.ref(file.path).putFile(
          file,
        );
      } else {
        print("ex");
        // User canceled the picker
      }
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff04045b),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/7,

                    child: Image.asset("assets/kingston.png"),
                  ),
                  Spacer(),
                  Container(

                    child: Icon(Icons.list_outlined,
                      color: Colors.white,
                      size: 50,),
                  )
                ],
              ),
              Container(child: Column(
                children: [
                  GestureDetector(
                onTap: (){
                  pickFile();
                },
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Upload Past Papers",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(

                      hint: Text("Select Your Batch",
                          style: TextStyle(color:Colors.white)),
                      items: batch,
                      onChanged: (Object? value) {
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      hint: Text("Select Your Subject",
                        style: TextStyle(color: Colors.white),),
                      items: subject,
                      onChanged: (Object? value) {  },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      hint: Text("Select Your Year",
                          style: TextStyle(color: Colors.white)),
                      items: year,
                      onChanged: (Object? value) {  },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles();

                      // if (result != null) {
                      //  File file = File(result.files.single.path);
                      // } else {
                      //   // User canceled the picker
                      // }
                    },
                    child: Container(
                     color: Colors.white,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                                "Upload File"
                            ),
                            SizedBox(width: 10,),
                            Icon(Icons.upload)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
