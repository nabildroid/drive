import 'package:drive/cubits/auth_cubit.dart';
import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/pages/main/files/files.dart';
import 'package:drive/pages/main/stars/stars.dart';
import 'package:drive/pages/main/syncing/syncing.dart';
import 'package:drive/repositories/files/files_repository.dart';
import 'package:drive/repositories/synced_folders/synced_folder_repository.dart';
import 'package:drive/repositories/users/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home.dart';

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);
  final _key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (ctx) => AppCubit(
              ctx.read<AuthState>().user!,
              ctx.read<UserRepository>(),
              ctx.read<SyncedFolderRepository>(),
              ctx.read<FilesRepository>(),
            ),
        child: Scaffold(
          body: Navigator(
            key: _key,
            initialRoute: "/home",
            onGenerateRoute: (route) {
              if (route.name == "/files") {
                return MaterialPageRoute(builder: (_) => FilePage());
              }

              if (route.name == "/stars") {
                return MaterialPageRoute(builder: (_) => StarsPage());
              }

              if (route.name == "/syncing") {
                return MaterialPageRoute(builder: (_) => SyncingPage());
              }

              return MaterialPageRoute(builder: (_) => Home());
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomBottomNavigationBar(_key),
        ));
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigation;
  const CustomBottomNavigationBar(
    this.navigation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width - 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home),
          IconButton(
            icon: Icon(Icons.abc_outlined),
            onPressed: () {
              print("hello world");
              navigation.currentState?.pushNamed("/cxcx");
            },
          ),
          Icon(Icons.home),
          Icon(Icons.home),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFFC4C4C4),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
