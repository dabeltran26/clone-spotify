import 'dart:convert';
import 'package:clone_spotify/models/user_data_model.dart';
import 'package:clone_spotify/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class UserRepository{

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  String baseUrl = Constants.baseUrl;

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

  Future<UserData> getInfoUser(String email, String password) async{

    var  body = {
      "data" : {
        "nombreUsuario": email,
        "clave": password
      }
    };

    final headers = {
      "X-MC-SO" : "Wigilabs Test"
    };

    final uri = Uri.parse('https://$baseUrl/api/index.php/v1/soap/LoginUsuario.json');
    final response = await http.post(uri,headers: headers,body: json.encode(body));
    var  userResponse = json.decode(response.body);
    UserData user = UserData.fromJson(userResponse);
    return user;
    }
  }
