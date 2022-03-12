import 'package:drive/models/main.dart';
import 'package:drive/models/users_model.dart';
import 'package:drive/repositories/users/users_repository.dart';

class RemoteUsersRepository extends UserRepository {
  @override
  Future<User?> get(String id) {
    throw UnimplementedError();
  }

  @override
  Stream<Profile> getProfile(String id) async* {
    yield Profile(
      User("sdsds", "dsdsd", "https://github.com/nabildroid.png"),
      DateTime.now(),
      22,
    );
  }

  @override
  Future<Profile> updateProfile(Profile profile) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
