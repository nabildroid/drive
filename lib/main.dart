import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';

bool USE_FIRESTORE_EMULATOR = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (USE_FIRESTORE_EMULATOR) {
    final host = Platform.isAndroid ? "192.168.43.198" : "localhost";
    FirebaseFirestore.instance.settings = Settings(
      host: "$host:8080",
      sslEnabled: false,
      persistenceEnabled: false,
    );

    FirebaseAuth.instance.useAuthEmulator(host, 9099);
  }

  runApp(MyApp());
}
