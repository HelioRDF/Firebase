import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class fireStore {
  static FirebaseFirestore db;

  static void testarFireStore() async {
    await inicializarFirebase();
    addFireStore("Helio", 31);
    addFireStore("Aline", 28);
    addFireStore("Teté", 7);
    buscarDocsFireStoreWhere();
    buscarDocsFireStoreOrdeBy();
  }

  static void inicializarFirebase() async {
    await WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    db = await FirebaseFirestore.instance;
  }

  static Future<void> salvarOuAtualizarFireStore(nome, idade) async {
    await FirebaseFirestore.instance.collection("Usuarios").doc("perfil").set(
      {"nome": nome, "idade": idade},
    );
  }

  static Future<void> addFireStore(nome, idade) async {
    DocumentReference ref = await db.collection("users").add(
      {"nome": nome, "idade": idade},
    );
    print("Documento: " + ref.id);
  }

  static Future<void> removeFireStore() async {
    db.collection("noticias").doc("FRYsuIY0lzrmDqp5zpBc").delete();
  }

  static Future<void> buscarDocFireStore() async {
    DocumentSnapshot snapshot =
        await db.collection("Usuarios").doc("pontuacao").get();
    var info = snapshot.data();
    print("Dados: " + snapshot.data().toString());
    print(info["aline"]);
  }

  static Future<void> buscarDocsFireStore() async {
    QuerySnapshot querySnapshot =
        await db.collection("Usuarios").getDocuments();
    for (DocumentSnapshot obj in querySnapshot.docs) {
      var dados = obj.data();
      print(obj.id + " -> " + dados.toString());
    }
  }

  static Future<void> buscarDocsFireStoreWhere() async {
    QuerySnapshot querySnapshot = await db
        .collection("users")
        .where("nome", isEqualTo: "Helio")
        .getDocuments();
    for (DocumentSnapshot obj in querySnapshot.docs) {
      var dados = obj.data();
      print(obj.id + " -> " + dados.toString());
    }
  }

  static Future<void> buscarDocsFireStoreOrdeBy() async {
    QuerySnapshot querySnapshot = await db
        .collection("users")
        .orderBy("idade", descending: false)
        .limit(2)
        .getDocuments();
    for (DocumentSnapshot obj in querySnapshot.docs) {
      var dados = obj.data();
      print(obj.id + " -> " + dados.toString());
    }
  }

  static Future<void> listenFireStore() async {
    await db.collection("Usuarios").snapshots().listen((snapshot) {
      for (DocumentSnapshot obj in snapshot.docs) {
        var dados = obj.data();
        print(obj.id + " -> " + dados.toString());
      }
    });
  }
}
