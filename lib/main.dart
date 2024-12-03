import 'package:chatapp/auth/authgate.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/themes/themeprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(
      ChangeNotifierProvider(create: (context)=>Themeprovider(),
      child:       const MyApp()
,)
      );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
debugShowCheckedModeBanner: false,
      home: const Authgate(),
      theme:Provider.of<Themeprovider>(context).themeData ,
    )
    ;

  }
}

