import 'package:flutter/material.dart';

class Usertile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const Usertile({
  super.key,
  required this.text,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)
        ),
        margin:const  EdgeInsets.symmetric(vertical: 25,horizontal: 25),
        padding:const  EdgeInsets.only(top: 20,left: 20,right: 
        20),
        child: Row(
          children: [
            //icon
           const  Icon(Icons.person),
           const SizedBox(width: 20,),
            //username
            Text(text)
          ],
        ),
      ),
    );
  }
}