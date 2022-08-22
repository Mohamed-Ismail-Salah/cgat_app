import 'package:chat_app/pages/Register.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Chat_App());
}
 class Chat_App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       routes: {
         Chat.id:(context)=>Chat(),
         Login.id: (context)=>Login(),
         Register.id:(context)=>Register(),
       },
        initialRoute: 'login',
     );
  }

 }