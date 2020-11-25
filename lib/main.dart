import 'package:firebase/firebase/authFirebase.dart';
import 'package:firebase/firebase/storageFirebase.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() async {
  authFirebase.teste();
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _imagem;
  var _urlImagemRecuperada;
  String status=storageFirebase.status;

    _uploadImagem(img) async {
    String aux = await storageFirebase.uploadImage(img);
    await setState(() {
      _urlImagemRecuperada = aux;
    });
  }

  _recuperarImagem(bool daCamera) async {
    var aux = await storageFirebase.recuperarImagem(daCamera);
    setState(() {
      _imagem = aux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar imagem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Camera"),
              onPressed: () {
                _recuperarImagem(true);
              },
            ),
            RaisedButton(
              child: Text("Galeria"),
              onPressed: () {
                _recuperarImagem(false);
              },
            ),
            _imagem == null ? Container() : Image.file(_imagem),
            Text(status),

            _imagem == null
                ? Container()
                : RaisedButton(
                    child: Text("Upload Storage"),
                    onPressed: () {
                      _uploadImagem(_imagem);
                      setState(() {
                       status= storageFirebase.status;
                      });
                    },
                  ),
            _urlImagemRecuperada == null
                ? Container(
                    child: Text("..."),
                  )
                : Image.network(_urlImagemRecuperada)
          ],
        ),
      ),
    );
  }
}
