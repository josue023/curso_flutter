import 'package:firebase_auth/firebase_auth.dart';

class FireAuth{

  static Future<User?> singInUsingEmailAndPass({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      user = userCredential.user;
    } on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("No user with this email.");
      }else if(e.code == "wrong-password"){
        print("Wrong password.");
      }
    }
    return user;
  }
}