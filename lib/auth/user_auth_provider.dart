import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthProvider {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLogged() {
    var user = _auth.currentUser;
    return user != null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebase() async {
    await _auth.signOut();
  }
  
  Future<void> signInWithGoogle() async {
      // Google Sign in
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;

      // Credenciales para firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      // Firebase sign in
      final authResult = await _auth.signInWithCredential(credential);
      final User user = authResult.user;
      assert(!user.isAnonymous);
    }
}
