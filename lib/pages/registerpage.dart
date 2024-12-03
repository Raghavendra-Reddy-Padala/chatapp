import 'package:chatapp/auth/authsevice.dart';
import 'package:chatapp/componets/myButtons.dart';
import 'package:chatapp/componets/mytextfielfd.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
 final    void Function()? onTap;

  Registerpage({super.key,
  required this.onTap});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

void register(BuildContext context){
  //get auth srvice
  final auth=Authservice();
  //signup method only if both passes matches
  if(password.text==confirmpassword.text){
    try{
      auth.signupwithEmailandPassword(email.text, 
  password.text
  );
    }catch(e){
       showDialog(context: context, builder:(context)=> AlertDialog(
      title: Text(e.toString()),
  )
   );
    }
  }//if paass wont matches throws an error
  else{
     showDialog(context: context, builder:(context)=> const AlertDialog(
      title: Text('Passwords wont match'),
  )
   );
  }
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            "Da ochinava iga Register chesko",
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
          //confirm pass
          Mytextfielfd(
            hintText: "confim your password",
            obscureText: true,
            controller: confirmpassword,
          ),
          //logiin now
          const SizedBox(
            height: 25,
          ),
           Mybuttons(text: "Register",ontap: () => register(context),),
           //register now 
            const SizedBox(
            height: 15,
          ),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const   Text("Already Have An account?  "),
              GestureDetector(onTap:onTap,child:  Text("Login Now!",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple[600]),))
            ],
           )
        ],
      ),
    );
  }
}