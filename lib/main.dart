// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flashchat_medium/firebase_options.dart';
import 'package:flashchat_medium/ui/pages/chat_page.dart';
import 'package:flashchat_medium/ui/pages/home_page.dart';
import 'package:flashchat_medium/ui/pages/login_page.dart';
import 'package:flashchat_medium/ui/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          HomePage.id: (context) => const HomePage(),
          ChatPage.id: (context) => ChatPage(),
          LoginPage.id: (context) => LoginPage(),
          RegistrationPage.id: (context) => const RegistrationPage()
        });
  }
}
