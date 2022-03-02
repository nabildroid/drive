import 'package:drive/models/main.dart';

abstract class UserRepository extends ProfileRepository {
  Future<User?> get(String id);
}

abstract class ProfileRepository {
  // CHECK i don't know why we need the id of this user profile!
  Stream<Profile> getProfile(String id);
  Future<void> updateProfile(Profile profile);
}
