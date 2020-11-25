import 'package:firebase/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

abstract class storageFirebase {
  static String status = "xxx";

  static Future<String> uploadImage(img) async {
    await WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseStorage storage = FirebaseStorage.instance;
    //Referenciar arquivo
    firebase_storage.Reference pastaRaiz = storage.ref();
    firebase_storage.Reference arquivo =
        pastaRaiz.child("fotos").child("foto1.jpg");

    //Fazer upload da imagem
    firebase_storage.UploadTask task = arquivo.putFile(img);

    //Controlar progresso do upload
    task.snapshotEvents.listen((storageEvent) {
      if (storageEvent.runtimeType == firebase_storage.TaskState.running) {
        setState() {
          status = "Em progresso";
        }
      } else if (storageEvent.runtimeType ==
          firebase_storage.TaskState.success) {
        setState() {
          status = "Upload realizado com sucesso!";
        }
      }
    });
    var urlImg;

    await arquivo.getDownloadURL().then((downloadURL) {
      urlImg = downloadURL.toString();
    });
    return urlImg;
  }

  static Future<File> recuperarImagem(bool daCamera) async {
    PickedFile imagemSelecionada;
    if (daCamera) {
//camera
      imagemSelecionada =
          await ImagePicker().getImage(source: ImageSource.camera);
    } else {
//galeria
      imagemSelecionada =
          await ImagePicker().getImage(source: ImageSource.gallery);
    }
    File selected = File(imagemSelecionada.path);
    return selected;
  }
}
