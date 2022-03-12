import 'package:drive/cubits/auth_cubit.dart';
import 'package:drive/cubits/app_cubit.dart';
import 'package:drive/cubits/files_cubit.dart';
import 'package:drive/cubits/stars_cubit.dart';
import 'package:drive/cubits/syncing_cubit.dart';
import 'package:drive/pages/main/files/files.dart';
import 'package:drive/pages/main/stars/stars.dart';
import 'package:drive/pages/main/syncing/syncing.dart';
import 'package:drive/repositories/files/files_repository.dart';
import 'package:drive/repositories/stars/stars_repository.dart';
import 'package:drive/repositories/synced_folders/synced_folder_repository.dart';
import 'package:drive/repositories/users/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);
  final _key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final filesRepo = RepositoryProvider.of<FilesRepository>(context);
    final starsRepo = RepositoryProvider.of<StarsRepository>(context);
    final userRepo = RepositoryProvider.of<UserRepository>(context);
    final syncedRepo = RepositoryProvider.of<SyncedFolderRepository>(context);

    final auth = BlocProvider.of<AuthCubit>(context);

    final appCubit = AppCubit(
      auth.state.user!,
      userRepo,
      syncedRepo,
      filesRepo,
    );

    return BlocProvider.value(
        value: appCubit,
        child: BlocBuilder<AppCubit, AppState>(
            bloc: appCubit,
            buildWhen: (a, b) => a.loading != b.loading,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Scaffold(
                body: Navigator(
                  key: _key,
                  initialRoute: "/home",
                  onGenerateRoute: (route) {
                    if (route.name == "/files") {
                      final arguments = route.arguments as FilesPageArguments;

                      return MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => FilesCubit(appCubit, filesRepo),
                          child: FilePage(arguments.firstPath!),
                        ),
                      );
                    }

                    if (route.name == "/stars") {
                      return MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => StarsCubit(appCubit, starsRepo),
                          child: const StarsPage(),
                        ),
                      );
                    }

                    if (route.name == "/syncing") {
                      return MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => SyncingCubit(appCubit, syncedRepo),
                          child: const SyncingPage(),
                        ),
                      );
                    }

                    return MaterialPageRoute(
                      builder: (_) => const Home(),
                    );
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: CustomBottomNavigationBar(_key),
              );
            }));
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
