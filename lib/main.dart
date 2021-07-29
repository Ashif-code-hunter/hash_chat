import 'package:flutter/material.dart';
import 'package:hash_chat/screens/welcome_screen.dart';
import 'package:hash_chat/screens/login_screen.dart';
import 'package:hash_chat/screens/registration_screen.dart';
import 'package:hash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HashChat());
}

class HashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: WelcomeScreen(),
      initialRoute:WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
