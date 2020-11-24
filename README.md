# firebase

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- https://pub.dev/
firebase_core: ^0.5.2
cloud_firestore: ^0.14.3
firebase_storage: ^5.0.1
firebase_auth: ^0.18.3

Em android/app/build.grade
incluir:
multiDexEnabled true
dentro de default config

Necessário incluir:
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  dentro do main.dart



  void main() async {

    Firestore db = Firestore.instance;

    var pesquisa = "ana";
    QuerySnapshot querySnapshot = await db.collection("usuarios")
    //.where("nome", isEqualTo: "jamilton")
    //.where("idade", isEqualTo: 31)
    //.where("idade", isGreaterThan: 15)//< menor, > maior, >= maior ou igual, <= menor ou igual
    //.where("idade", isLessThan: 30)
    //descendente (do maior para o menor) ascendente (do menor para o maior)
    //.orderBy("idade", descending: true )
    //.orderBy("nome", descending: false )
    //.limit(1)
    //m  m
    //10...15
    .where("nome", isGreaterThanOrEqualTo: pesquisa)
    .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff" )
    .getDocuments();

    for( DocumentSnapshot item in querySnapshot.documents ){
      var dados = item.data;
      print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]}");
    }


    runApp(App());

  }
