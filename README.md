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