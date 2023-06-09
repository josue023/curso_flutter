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

  static Future<User?> singUpUsingEmailAndPass({
    required String name,
    required String email,
    required String pass
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: pass
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    }on FirebaseAuthException catch(e){
      if(e.code == "weak-password"){
        print("Warning: clave debil");
      }else if(e.code == "email-already-in-use"){
        print("Error: Email already in use");
      }
    }catch(e){
      print(e);
    }

    return user;
  }
}