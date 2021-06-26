import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intexe/profile.dart';
import './productpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Info());
}

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Posts');

  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('interview experience'),
      ),
      body: ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                child: ProductBox(
                  name: snapshot[index].get('name'),
                  age: snapshot[index].get('age'),
                  city: snapshot[index].get('city'),
                  imageurl: snapshot[index].get('imageurl'),
                  work: snapshot[index].get('work'),
                  designation: snapshot[index].get('designation'),
                  link: snapshot[index].get('link'),
                  experience: snapshot[index].get('experience'),
                  videourl: snapshot[index].get('videourl'),
                  pdfurl: snapshot[index].get('pdfurl'),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                            name: snapshot[index].get('name'),
                            age: snapshot[index].get('age'),
                            city: snapshot[index].get('city'),
                            imageurl: snapshot[index].get('imageurl'),
                            work: snapshot[index].get('work'),
                            designation: snapshot[index].get('designation'),
                            link: snapshot[index].get('link'),
                            experience: snapshot[index].get('experience'),
                            videourl: snapshot[index].get('videourl'),
                            pdfurl: snapshot[index].get('pdfurl')),
                      ));
                });
          }),
    );
  }
}
