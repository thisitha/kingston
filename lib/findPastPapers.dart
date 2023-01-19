
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingston/dashboard.dart';
import 'package:kingston/pastpaperList.dart';
import 'package:kingston/viewPDF.dart';
import 'package:kingston/viewPastpapers.dart';

List<DropdownMenuItem<String>> batch = [
  DropdownMenuItem(child: Text("Batch 2020"),value: "2020"),
  DropdownMenuItem(child: Text("Batch 2019"),value: "2019"),
  DropdownMenuItem(child: Text("Batch 2018"),value: "2018"),

];

List<DropdownMenuItem<String>> subject = [
  DropdownMenuItem(child: Text("UI/UX Development"),value: "uiux"),
  DropdownMenuItem(child: Text("Mobile Development"),value: "mobile"),


];

List<DropdownMenuItem<String>> year = [
  DropdownMenuItem(child: Text("2020"),value: "2020"),
  DropdownMenuItem(child: Text("2019"),value: "2019"),


];

  String selectedBatch ="2020";
String selectedSubject="uiux";
String selectedYear="2020";

class findPastPapers extends StatefulWidget {
  const findPastPapers({Key? key}) : super(key: key);

  @override
  State<findPastPapers> createState() => _findPastPapersState();
}

class _findPastPapersState extends State<findPastPapers> {
  @override
  Widget build(BuildContext context) {
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
                    width: MediaQuery.of(context).size.width/10,
                    height:  MediaQuery.of(context).size.width/10,
                    color: Colors.red,
                  ),
                  Spacer(),
                  GestureDetector(
                  onTap: (){
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => dashboardScreen(),));
                  },
                    child: Container(
                      child: Icon(Icons.logout,
                      size: 50,
                      color: Colors.white,),
                    ),
                  )
                ],
              ),
              Container(child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Find Past Papers",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: selectedBatch,
                    hint: Text("Select Your Batch",
                    style: TextStyle(color:Colors.white)),
                      items: batch,
                    onChanged: (value) {
                      selectedBatch = value!;
                      print(selectedBatch);
                    },
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: selectedSubject,
                      hint: Text("Select Your Subject",
                      style: TextStyle(color: Colors.white),),
                      items: subject,
                      onChanged: (value) {
                        selectedSubject = value!;
                        print(selectedSubject);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: selectedYear,
                      hint: Text("Select Your Year",
                          style: TextStyle(color: Colors.white)),
                      items: year,
                      onChanged: (value) {
                        selectedYear = value!;
                        print(selectedYear);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {

                      });
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => pastpaperList(),));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Find "
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => viewPastpapers(),));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/3,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Find More "
                        ),
                      ),
                    ),
                  ),
                 selectedYear =="2020" && selectedSubject=="uiux"? Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => viewPDF(pdfPath: "assets/2017.pdf"),));
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       height:MediaQuery.of(context).size.width/5,
                       color: Color(0xFFf5f5f5),
                       child: Row(
                         children: [
                           Container(
                             height: 100,
                             width: 100,
                             child: Image.asset("assets/pdf.png"),
                           ),
                           Text("UI UX \n 2020",
                             style: TextStyle(
                                 fontSize: 20
                             ),),
                           Spacer(),

                         ],
                       ),
                     ),
                   ),
                 )
                     : selectedYear =="2020" && selectedSubject=="mobile"?Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => viewPDF(pdfPath: "assets/2018.pdf"),));
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       height:MediaQuery.of(context).size.width/5,
                       color: Color(0xFFf5f5f5),
                       child: Row(
                         children: [
                           Container(
                             height: 100,
                             width: 100,
                             child: Image.asset("assets/pdf.png"),
                           ),
                           Text("Mobile Dev \2020",
                             style: TextStyle(
                                 fontSize: 20
                             ),),
                           Spacer(),

                         ],
                       ),
                     ),
                   ),
                 )
                        :selectedYear=="2019" && selectedSubject=="uiux"?Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => viewPDF(pdfPath: "assets/2019.pdf"),));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height:MediaQuery.of(context).size.width/5,
                              color: Color(0xFFf5f5f5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset("assets/pdf.png"),
                                  ),
                                  Text("UI UX  \n2019",
                                    style: TextStyle(
                                        fontSize: 20
                                    ),),
                                  Spacer(),

                                ],
                              ),
                            ),
                          ),
                        )
                            :selectedYear=="2019" && selectedSubject=="mobile"?Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => viewPDF(pdfPath: "assets/2020.pdf"),));
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       height:MediaQuery.of(context).size.width/5,
                       color: Color(0xFFf5f5f5),
                       child: Row(
                         children: [
                           Container(
                             height: 100,
                             width: 100,
                             child: Image.asset("assets/pdf.png"),
                           ),
                           Text("Mobile Dev  \n2019",
                             style: TextStyle(
                                 fontSize: 20
                             ),),
                           Spacer(),

                         ],
                       ),
                     ),
                   ),
                 )
                     :Container()
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
