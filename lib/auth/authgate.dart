import 'package:chatapp/auth/loginorregister.dart';
import 'package:chatapp/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user logged in
        if(snapshot.hasData){
          return  Homepage();

        }//user is not logged in
        else{
          return const Loginorregister();
        }
      },
    );
  }
}