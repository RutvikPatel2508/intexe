import 'dart:ffi';

import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  ProductBox( {this.name,
      this.age,
      this.city,
      this.work,
      this.experience,
      this.designation,
      this.link,
      this.imageurl,
      this.videourl,
      this.pdfurl});

 final String name;
  final String age;
  final String city;
  final String work;
  final String experience;
  final String designation;
  final String link;
  final String imageurl;
  final String videourl;
  final String pdfurl;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 SizedBox(
                  child: CircleAvatar(
                   backgroundImage:NetworkImage(imageurl),radius: 50,),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                width: 15,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(this.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                            ),
                            Container(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("age:"),
                                        Text(this.age,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                      ])),
                            ),
                            Container(
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("work:"),
                                                Text(this.work,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ])),
                                    ),
                                     Container(
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text("designation:"),
                                                Text(this.designation,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ])),
                                    ),
                                     Container(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text("city:"),
                                        Text(this.city,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500)),
                                      ])),
                            ),
                          ],
                        )))
              ]),
        )));
  }
}

