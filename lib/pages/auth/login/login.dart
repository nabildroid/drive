import 'package:drive/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signIn = context.read<AuthCubit>().googleSignIn;

    return Scaffold(
      body: Center(
          child: IconButton(
        onPressed: signIn,
        icon: Icon(Icons.abc),
      )),
    );
  }
}
