import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String avatar;

  User(this.id, this.name, this.avatar);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, avatar];
}

class AuthUser extends User {
  final bool isPremuim;

  AuthUser({
    required String id,
    required String name,
    required String avatar,
    required this.isPremuim,
  }) : super(id, name, avatar);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, avatar, isPremuim];
}

class Profile extends User {
  final DateTime lastChange;
  final int size;

  // todo bloc direct creation
  Profile(User user, this.lastChange, this.size)
      : super(user.id, user.name, user.avatar);

  @override
  // TODO: implement props
  List<Object?> get props => [...super.props, lastChange, size];
}
