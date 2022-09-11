import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manan_mobile/models/user_model.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _signIn = GoogleSignIn();

  //get current user
  User getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  //get UserModel from FirebaseUser
  UserModel _getUserFromFirebaseUser(User user) {
    return user == null
        ? null
        : UserModel(
            userId: user.uid,
            userEmail: user.email,
            userProfilePicture: user.photoURL);
  }

  // get streams of FirebaseAuth
  Stream<UserModel> get userStream {
    return _auth.authStateChanges().map(_getUserFromFirebaseUser);
  }

  //sign in using email and password
  Future signInWithEmailAndPass(String email, String pass) async {
    UserCredential credential =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    User user = credential.user;
    return _getUserFromFirebaseUser(user);
  }

  //register user with email and password
  Future registerUserWithEmailAndPass(String email, String pass) async {
    UserCredential credential =
        await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    User user = credential.user;
    return _getUserFromFirebaseUser(user);
  }

  //sign in using Google Sign In Provider
  Future googleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _signIn.signIn();
    GoogleSignInAuthentication authentication =
        await googleSignInAccount.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken);

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    User user = userCredential.user;
    return _getUserFromFirebaseUser(user);
  }

  //forgot password
  Future forgotPasswordEmailSender(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    return null;
  }

  //sign out
  Future signOut() async {
    await _signIn.signOut();
    await _auth.signOut();
    return null;
  }
}
