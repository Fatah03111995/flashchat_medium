import 'package:flashchat_medium/ui/pages/chat_page.dart';
import 'package:flashchat_medium/ui/pages/home_page.dart';
import 'package:flashchat_medium/ui/pages/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
      home: const ChatPage(),
    );
  }
}
