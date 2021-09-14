import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();


  Future<String>SignIn({String email, String password}) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
          return " sign in";
    }on FirebaseAuthException catch(e){
      return e.message;


    }

  }
  Future<String>SignUp({String email, String password})async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return " sign up";
    }on FirebaseAuthException catch(e){
      return e.message;
    }


  }
}