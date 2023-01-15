import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingston/pastpaperList.dart';

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
                  Container(

                    child: Icon(Icons.list_outlined,
                    size: 50,),
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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => pastpaperList(),));
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
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
