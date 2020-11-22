import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  salvar();
  runApp(App());
}

void salvar() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firestore.instance
      .collection("Usuarios")
      .document("pontuacao")
      .setData({"carlos": "80", "silvana": "340"});
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
