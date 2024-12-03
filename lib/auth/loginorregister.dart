import 'package:chatapp/pages/loginpage.dart';
import 'package:chatapp/pages/registerpage.dart';
import 'package:flutter/material.dart';

class Loginorregister extends StatefulWidget {
  const Loginorregister({super.key});

  @override
  State<Loginorregister> createState() => _LoginorregisterState();
}

class _LoginorregisterState extends State<Loginorregister> {
  //intitally show login page
  bool showloginpage=true;
  //tooogle to swith between pages
  void togglepages(){
    setState(() {
      showloginpage=!showloginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showloginpage){
      return Loginpage(
        onTap: togglepages,
      );
    }else{
      return Registerpage(
        onTap: togglepages,
      );
    }
  }
}