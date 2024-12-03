import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const Chatbubble({super.key,required this.message,
  required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    //light mode vs  dark mode for correct buble colors
    return Container(
      padding:const  EdgeInsets.all(16),
      margin:const  EdgeInsets.symmetric(vertical: 2.5,horizontal: 25),
      decoration: BoxDecoration(
        color: isCurrentUser?Colors.yellow[400]:Colors.grey.shade500,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Text(message,style:const  TextStyle(
        fontWeight: FontWeight.bold,
      color: Colors.black
      ),

      ),
);
  }
}