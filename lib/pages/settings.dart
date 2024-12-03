import 'package:chatapp/themes/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const  Text("Settings ",style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.grey,),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary),
        margin:const  EdgeInsets.all(25),
        padding:const  EdgeInsets.all(16),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
       const    Text("Switch Mode"),
          //switch toggle
          CupertinoSwitch(value: Provider.of<Themeprovider>(context,listen: false).isDarkMode, onChanged: (value)
          =>Provider.of<Themeprovider>(context,listen: false).toggleTheme()

            
          ),
        ],),
      ),
    );
  }
}