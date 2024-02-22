import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ujikom/firebase_options.dart';
import 'package:ujikom/view/login.dart';
import 'provider/firebase_dbService.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Loginpage(),
    );
  }
}
