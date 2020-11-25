import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class authFirebase {
  static FirebaseAuth aut;
  static String email = "heliordf@hotmail.com";
  static String senha = "123456";

  static void teste() async {
    await iniciarFirebaseAuth();
    await login();
    //await logout();
    verificarSessao();
  }

  static Future<void> iniciarFirebaseAuth() async {
    await WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    aut = await FirebaseAuth.instance;
  }

  static Future<void> logout() async {
    aut.signOut();
  }

  static Future<void> login() async {
    /* Logando usuário */
    aut
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((firebaseUser) {
      print("Logar usuario: sucesso!! e-mail: " + firebaseUser.user.email);
    }).catchError((erro) {
      print("Logar usuario: erro " + erro.toString());
    });
  }

  static Future<void> verificarSessao() async {
    User usuarioAtual = await aut.currentUser ;
    if (usuarioAtual != null) {
      //logado
      print("Usuario atual logado email: " +  usuarioAtual.email);
    } else {
      //deslogado
      print("Usuario atual está DESLOGADO!!");
    }
  }

  static Future<void> criarConta() async {
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
