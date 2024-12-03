import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authservice{
  //instance of auth and firestore
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final FirebaseAuth  _auth = FirebaseAuth.instance;

  //get currect user
  User? getCurrentuser(){
    return _auth.currentUser;
  }
  //sign in
Future<UserCredential>signInWithEmailPassword(String email,String password)async{
  try{
    //sign user in
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
     password: password
     );
     //save user info if it doesnt already exist 
_firestore.collection("users").doc(userCredential.user!.uid).set(
  {
    'uid':userCredential.user!.uid,
    'email':email,
  },
);
    return userCredential;
  }on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}
  //sign up
Future<UserCredential>signupwithEmailandPassword(String email,String password )async{
  try{
    //create user
    UserCredential userCredential = 
    await _auth.createUserWithEmailAndPassword(
      email: email
    , password: password
    );
//save user info in a sepreate doc
_firestore.collection("users").doc(userCredential.user!.uid).set(
  {
    'uid':userCredential.user!.uid,
    'email':email,
  },
);
      return userCredential;
  } on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}


  //sign out

Future<void>signout() async{
  return await _auth.signOut();
}

  //errors
}