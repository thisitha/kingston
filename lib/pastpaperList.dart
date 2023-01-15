import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingston/removePastpapers.dart';

class pastpaperList extends StatefulWidget {
  const pastpaperList({Key? key}) : super(key: key);

  @override
  State<pastpaperList> createState() => _pastpaperListState();
}

class _pastpaperListState extends State<pastpaperList> {
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
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Past Paper List",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                       width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/2,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                 Text("Batch 5 \nMobile Development \n2022",
                                 style: TextStyle(
                                   fontSize: 20
                                 ),),
                                 Spacer(),
                                 Icon(Icons.download,
                                 size: 40,)
                               ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                Text("Batch 5 \nMobile Development \n2022",
                                  style: TextStyle(
                                      fontSize: 20
                                  ),),
                                Spacer(),
                                Icon(Icons.download,
                                  size: 40,)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                Text("Batch 5 \nMobile Development \n2022",
                                  style: TextStyle(
                                      fontSize: 20
                                  ),),
                                Spacer(),
                                Icon(Icons.download,
                                  size: 40,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),


                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => removePastpapers(),));
                    },
                    child: Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.downloading),
                            Text(
                                "View Old Papers"
                            ),
                            SizedBox(width: 10,),
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
