import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:drive/models/main.dart';
import 'package:drive/repositories/users/users_repository.dart';
import 'package:drive/services/firestore.dart';

class RemoteUsersRepository extends UserRepository {
  @override
  Future<User?> get(String id) {
    return Firestore.users().doc(id).get().then((value) => value.data());
  }

  @override
  Stream<Profile> getProfile(String id) async* {
    yield Profile(
      User("sdsds", "dsdsd", "https://github.com"),
      DateTime.now(),
      15,
    );

    // return Firestore.users()
    //     .doc(id)
    //     .snapshots()
    //     .where((event) => event.exists)
    //     .map((event) {
    //   return event.data()!;
    // });
  }

  @override
  Future<Profile> updateProfile(Profile profile) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
