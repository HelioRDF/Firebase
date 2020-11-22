import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
 // salvarOuAtualizarFireStore();
  //addFireStore();
  //removeFireStore();
  buscarFireStore();
  runApp(MaterialApp(
    home: App(),
  ));
}

Future<void>  salvarOuAtualizarFireStore() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance
      .collection("Usuarios")
      .doc("pontuacao")
      .set({"helio": "888", "aline": "888"});
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

Future<void> removeFireStore() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = await FirebaseFirestore.instance;
  db.collection("noticias").doc("VRyq3viDZ0X7i97vasdK").delete();
}

Future<void> buscarFireStore() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = await FirebaseFirestore.instance;
  DocumentSnapshot snapshot =await db.collection("Usuarios").doc("pontuacao").get();
  print("Dados: "+ snapshot.data().toString());
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
