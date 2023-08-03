import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

signUp(String e1, String p1) {
  FirebaseAuth auth = FirebaseAuth.instance;
  auth.createUserWithEmailAndPassword(email: e1, password: p1);
  print(e1);
  print(p1);
}

bool checkData() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return true;
  }
  return false;
}

Future<String> login(String email, String password) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return "Login Successfully";
  } on FirebaseException catch (e) {
    if (e.code == "user not found") {
      return "User not found for that email";
    } else if (e.code == "wrong password") {
      return 'Wrong password';
    }
  }
  return "Please Enter valid Email and Password";
}

Future<bool> googleSign() async {
  GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
  var credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signInWithCredential(credential);
  return checkData();
}

void logOut() {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  firebaseAuth.signOut();
  GoogleSignIn googleSignIn = GoogleSignIn();
  googleSignIn.signOut();
}
