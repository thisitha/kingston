import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class viewPastpapers extends StatefulWidget {
  const viewPastpapers({Key? key}) : super(key: key);

  @override
  State<viewPastpapers> createState() => _viewPastpapersState();
}

class _viewPastpapersState extends State<viewPastpapers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff04045b),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:  FutureBuilder(
            future: getUserPromotionsAPI(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // customerName = snapshot.data[0]["member_name"];
              return (snapshot.data != null)
                  ? Container(
                height: 77,
                child: RefreshIndicator(
                  onRefresh: (){
                    return Future.delayed(
                      Duration(seconds: 1),
                          () {
                        setState(() {
                        });
                      },
                    );
                  },
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height:MediaQuery.of(context).size.width/5,
                              color: Color(0xFFf5f5f5),
                              child: GestureDetector(
                                onTap: (){
                                  openPdf(snapshot.data[index]["downloadUrl"]);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset("assets/pdf.png"),
                                    ),
                                    Text(snapshot.data[index]["name"],
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
                          ),
                        );
                      }),
                ),
              )
                  : Container(
                  height: 77,
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 1,
                          ),
                        )
                    ),
                  )
              );
            }),
        ),
      );

  }
}

Future<List> getUserPromotionsAPI() async {
  print("Get_product_List Api Called");



  final response = await http.get(
      Uri.parse("http://kingston.shashanka.ogilvydigital.net/api.php"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },

  );
  Map<String, dynamic> map = json.decode(response.body)[0];
  print(json.decode(response.body));

  List<dynamic> data = map["pdf_set"];
  return data;
}
openPdf(String url) async {
  
  final uri = Uri.parse(url.toString());
  if (await canLaunchUrl(uri)) {
    print("error");
    await launchUrl(uri);
  } else {
    print("error");
    throw 'Could not launch $url';

  }
}