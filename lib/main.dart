import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  //salvarOuAtualizarFireStore();
  addFireStore();
  runApp(MaterialApp(
    home: App(),
  ));
}

Future<void>  salvarOuAtualizarFireStore() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firestore.instance
      .collection("Usuarios")
      .document("pontuacao")
      .setData({"helio": "888", "aline": "888"});
}

Future<void> addFireStore() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = await FirebaseFirestore.instance;
  DocumentReference ref = await db.collection("noticias")
  .add({
    "titulo" : "Ondas de calor em São Paulo",
    "descricao" : "texto de exemplo..."
  });
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
        child: Column(children: [
          Text("Hello Word!")
        ],),
      ),
    );
  }
}
