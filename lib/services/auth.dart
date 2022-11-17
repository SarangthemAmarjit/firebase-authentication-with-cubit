import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  saveuid(uid) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", uid);
  }

  // Create user obj based on FirebaseUser
  Userok? _userFromFirebase(User user) {
    return user != null ? Userok(uid: user.uid) : null;
  }

  Stream<Userok?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  Future signInwithemailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      String uid = result.user!.uid;
      saveuid(uid);

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerwithemailandPassword(String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String uid = result.user!.uid;
    User user = result.user!;
    saveuid(uid);
    return _userFromFirebase(user);
  }
}
