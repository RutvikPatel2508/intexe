import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intexe/chewie_item.dart';
import 'package:video_player/video_player.dart';
import 'package:intexe/pdf_viewer_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
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
  Profile(
      {this.name,
      this.age,
      this.city,
      this.work,
      this.experience,
      this.designation,
      this.link,
      this.imageurl,
      this.videourl,
      this.pdfurl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('interview experience'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                height: 220,
                width: double.infinity,
                child: ChewieItem(
                  videoPlayerController:
                      VideoPlayerController.network(videourl),
                )),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: Text(
                  "Profile:",
                  style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold),
                ),
              ),
            ),
            Card(
                elevation: 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(imageurl),
                            radius: 50,
                          ),
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
                                                Text("Linked In:"),
                                                Container(
                                                  color: Colors.cyan[200],
                                                  child: RichText(text:TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "Click hear",
                                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                                         recognizer: TapGestureRecognizer()..onTap = ()async{
                                                           var url=link;
                                                           if(await canLaunch(url)){
                                                             await launch(url);
                                                           }
                                                           else{
                                                             throw "cannot load url";
                                                           }
                                                         }    )],
                                                       ),
                                                      ),
                                                ),
                                              ])),
                                    ),
                                  ],
                                )))
                      ]),
                )),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: Text(
                  "interview experience:",
                  style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                          "The first round was more about aptitude, marketing, statistics and general management topics. The second round was with middle-level marketing manager and HR manager. They were very impressed with my academic record.",
                          style: TextStyle(fontSize: 13)),
                    ),
                  ]),
              ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 8),
                child: Text(
                  "Resume:",
                  style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold),
                ),
              ),
            ),
            Container(
              child: pdfview(pdfurl),
              height: 400,
              width: 400,
            ),
          ],
        ));
  }
}
