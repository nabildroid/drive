import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';

import 'pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCFf1pRQwiOUKHpl8BFVb6RFye66ors_vY',
      appId: '1:528620373590:web:c9157bffcd2ed249205df7',
      messagingSenderId: '528620373590',
      projectId: 'drive-99e3e',
      authDomain: 'drive-99e3e.firebaseapp.com',
      storageBucket: 'drive-99e3e.appspot.com',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}
