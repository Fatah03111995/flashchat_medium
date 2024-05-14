import 'package:flashchat_medium/core/constants/constant.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static String id = 'chatpage/';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text(
          '⚡️Chat',
          style: TextStyles.mlBold,
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.close))],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Send',
              style: kSendButtonTextStyle,
            ),
          )
        ],
      )),
    );
  }
}
