import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class authFirebase {
  static Future<void> criarConta() async {
    await WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth aut = await FirebaseAuth.instance;
    String email = "heliordf@hotmail.com";
    String senha = "123456";
    aut
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((firebaseUser) {
      print("novo usuario: sucesso!! e-mail: " + firebaseUser.user.email);
    }).catchError((erro) {
      print("novo usuario: erro " + erro.toString());
    });
    FirebaseAuth usuarioAtual = (await aut.currentUser) as FirebaseAuth;
    if (usuarioAtual != null) {
      //logado
      print("Usuario atual logado email: " + usuarioAtual.currentUser.email);
    } else {
      //deslogado
      print("Usuario atual está DESLOGADO!!");
    }
  }
}
