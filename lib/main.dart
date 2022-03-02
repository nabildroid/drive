import 'package:drive/models/main.dart';
import 'package:drive/repositories/files/files_factory.dart';
import 'package:drive/repositories/files/local_files.dart';
import 'package:drive/repositories/files/remote_files.dart';
import 'package:drive/repositories/storage/storage_repository.dart';
import 'package:flutter/material.dart';

import 'pages/home/home.dart';

void main() async {
  final files =
      FilesRepositoyFactory(LocalFilesRepository(), RemoteFilesRepository());

  final screenshots = await files.createFolder(Folder([]));
  final short = await files.link(screenshots, LinkedNode("dsd", "sds", "edsd"));
  files.rename(short, "hello world");
  files.share(short, [User("esdd", "dsdsd", "dsdsd")]);

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
      home: const Home(),
    );
  }
}
