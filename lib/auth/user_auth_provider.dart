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

//anonimo sign in
  Future<void> anonymousSignIn() async {
    //hacer el sign in
    var user = _auth.currentUser;
    final anonymousUser = (await _auth.signInAnonymously()).user;
    //Mostrar el nombre del usuario como los digitos del 0 al 5 de su id, y con invitado al final
    await anonymousUser.updateProfile(
        displayName: "${anonymousUser.uid.substring(0, 5)}_Guest");

    //recargar el usuario
    await anonymousUser.reload();
  }

  //allow users to sign in with their own credentials using firebas
  Future<void> signInWithCredentials(String email, String password) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //allow users to create an account if they choose not to use google sign in
  Future<void> signUp({String email, String password}) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //signOut method to logout
  Future<void> signOut() async {
    return Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  //Retreive user information
  Future<String> getUser() async {
    return _auth.currentUser.email;
  }
}
