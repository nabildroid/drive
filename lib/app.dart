import 'package:drive/cubits/auth_cubit.dart';
import 'package:drive/pages/auth/login/login.dart';
import 'package:drive/repositories/files/files_factory.dart';
import 'package:drive/repositories/files/local_files.dart';
import 'package:drive/repositories/files/remote_files.dart';
import 'package:drive/repositories/stars/local_star.dart';
import 'package:drive/repositories/stars/remote_star.dart';
import 'package:drive/repositories/stars/stars_factory.dart';
import 'package:drive/repositories/users/local_users_repository.dart';
import 'package:drive/repositories/users/remote_users_repository.dart';
import 'package:drive/repositories/users/users_factory.dart';
import 'package:drive/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/main/main.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (ctx) => AuthCubit(_authService),
      child: MaterialApp(
        title: 'Drive',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  AppNavigator({Key? key}) : super(key: key);

  final _remoteUsersRepository = RemoteUsersRepository();
  final _localUsersRepository = LocalUsersRepository();

  final _remoteStarsRepository = RemoteStarRepository();
  final _localStarsRepository = LocalStarRepository();

  final _remoteFilesRepository = RemoteFilesRepository();
  final _localFilesRepository = LocalFilesRepository();

  @override
  Widget build(BuildContext context) {
    final isAuth = context.watch<AuthState>().isAuth;

    if (isAuth) {
      final _usersRepository = UsersRepositoryFactory(
        _remoteUsersRepository,
        _localUsersRepository,
      );

      final _starRepository = StarRepositoryFactory(
        _localStarsRepository,
        _remoteStarsRepository,
      );

      final _filesRepository = FilesRepositoyFactory(
        _localFilesRepository,
        _remoteFilesRepository,
      );

      return MultiRepositoryProvider(
        // CHECK i don't now if it good idea to instentiat repos here
        providers: [
          RepositoryProvider(create: (_) => _usersRepository),
          RepositoryProvider(create: (_) => _starRepository),
          RepositoryProvider(create: (_) => _filesRepository),
        ],
        child: Main(),
      );
    }

    return const Login();
  }
}
