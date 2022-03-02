import 'package:drive/models/main.dart';
import 'package:drive/repositories/users/users_repository.dart';

import 'local_users_repository.dart';
import 'remote_users_repository.dart';

class UsersRepositoryFactory extends UserRepository {
  final RemoteUsersRepository _remote;
  final LocalUsersRepository _local;

  UsersRepositoryFactory(this._remote, this._local);

  @override
  Future<User?> get(String id) {
    return _remote.get(id);
  }

  @override
  Stream<Profile> getProfile(String id) {
    return _remote.getProfile(id);
  }

  @override
  Future<Profile> updateProfile(Profile profile) async {
    final newProfile = await _remote.updateProfile(profile);
    await _local.updateProfile(newProfile);

    return newProfile;
  }
}
