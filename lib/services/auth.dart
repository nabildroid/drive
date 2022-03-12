import 'package:drive/models/main.dart' hide User;
import 'package:drive/models/users_model.dart';

class AuthService {
  void whenAuthChange(void Function({AuthUser? user}) onChange) {
    onChange(
      user: AuthUser(
        id: "sdsdsdsds",
        avatar: "https://github.com/nabildroid.png",
        name: "nabil",
        isPremuim: false, // todo add the custom claim
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    return;
  }

  Future<void> logOut() async {}
}
