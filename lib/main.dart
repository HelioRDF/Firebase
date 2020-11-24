import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase/fireStore.dart';
import 'package:firebase/firebase/authFirebase.dart';
import 'package:flutter/material.dart';

void main() async {
//fireStore.testarFireStore();
  authFirebase.teste();
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [Text("Hello Word!")],
        ),
      ),
    );
  }
}
