import 'package:drive/models/main.dart';
import 'package:drive/repositories/users/users_repository.dart';

class LocalUsersRepository extends UserRepository {
  @override
  Future<User> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Stream<Profile> getProfile(String id) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Profile> updateProfile(Profile profile) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
