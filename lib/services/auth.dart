import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy/model/customuser.dart';
import 'package:healthy/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Customuser? _userFromFirebase(User? user) {
    return user != null ? Customuser(uid: user.uid) : null;
  }

  Stream<Customuser?> get myuser {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future registerUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print("Lvoe ${user}");
      await DatabaseService(uid: user!.uid)
          .updateUserData('Crew User', '0', 100);

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    return await _auth.signOut();
  }
}
