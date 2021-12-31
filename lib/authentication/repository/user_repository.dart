import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository{

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  UserRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn}):_firebaseAuth = firebaseAuth ?? FirebaseAuth.instance, _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<void> signInWithCredentials(String email , String pass){
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
  }

  Future<UserCredential> signUp (String email, String pass) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
  }

  Future<Future<List<void>>> singOut() async{
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut()
    ]);
  }

  Future <bool> isSignedIn() async{
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String?> getUser() async{
    return (_firebaseAuth.currentUser)?.email;
  }
}