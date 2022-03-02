import 'package:drive/services/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/main.dart';

class AuthState extends Equatable {
  final AuthUser? user;
  final bool loading;

  const AuthState({this.user, this.loading = true});

  bool get isAuth {
    return user != null;
  }

  copyWith({AuthUser? user, bool? loading}) {
    return AuthState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [user, loading];
}

class AuthCubit extends Cubit<AuthState> {
  final AuthService _service;

  AuthCubit(this._service) : super(const AuthState()) {
    _service.whenAuthChange(
      ({user}) => emit(state.copyWith(user: user)),
    );
  }

  login(String mail, String password) {
    // emit(state.copyWith(user:));
  }

  googleSignIn() async {
    _load();
    await _service.signInWithGoogle();
    _loaded();
  }

  logout() async {
    _load();
    await _service.logOut();
    emit(const AuthState());
    _loaded();
  }

  _load() {
    emit(state.copyWith(loading: true));
  }

  _loaded() {
    emit(state.copyWith(loading: false));
  }
}
