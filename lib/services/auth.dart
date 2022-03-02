import 'package:drive/models/main.dart' hide User;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  void whenAuthChange(void Function({AuthUser? user}) onChange) {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        onChange();
      } else {
        onChange(
          user: AuthUser(
            id: user.uid,
            avatar: user.photoURL ?? "https://github.com/nabildroid.png",
            name: user.displayName ?? "nabil",
            isPremuim: false, // todo add the custom claim
          ),
        );
      }
    });
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(credential);
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
