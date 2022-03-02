import 'package:drive/cubits/auth_cubit.dart';
import 'package:drive/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/home/home.dart';

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
        home: const AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signIn = context.read<AuthCubit>().googleSignIn;
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state.isAuth) {
        return Home();
      }
      return Scaffold(
        body: Center(
            child: IconButton(
          onPressed: signIn,
          icon: Icon(Icons.abc),
        )),
      );
    });
  }
}
