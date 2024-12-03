import 'package:chatapp/auth/authsevice.dart';
import 'package:chatapp/componets/myButtons.dart';
import 'package:chatapp/componets/mytextfielfd.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
 final  void Function()? onTap;
  Loginpage({super.key,required this.onTap});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

void login(BuildContext context) async {
  //auth service
  final authservice =Authservice();

//try login 
try{
  await authservice.signInWithEmailPassword(email.text , password.text );
}
catch(e){
  showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text(e.toString()),
  )
   );
}

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Image.asset(
            "lib/assests/angry-panda.png",
            height: 80,
          ),
//welcomeback mesege
          const SizedBox(
            height: 30,
          ),
          Text(
            "ah model ochinava login avu!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),
          const SizedBox(
            height: 25,
          ),
          //email text field
          Mytextfielfd(
            hintText: "Enter Your Mail id",
            obscureText: false,
            controller: email,
          ),
//password
          Mytextfielfd(
            hintText: "Enter your password",
            obscureText: true,
            controller: password,
          ),
          //logiin now
          const SizedBox(
            height: 25,
          ),
           Mybuttons(text: "Log In",ontap: ()=>login(context),),
           //register now 
            const SizedBox(
            height: 15,
          ),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const   Text("Not a member?  "),
              GestureDetector(onTap:onTap
                
              ,child:  Text("Register Now!",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[600]),))
            ],
           )
        ],
      ),
    );
  }
}
