// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat_medium/core/constants/constant.dart';
import 'package:flashchat_medium/core/message_db.dart';
import 'package:flashchat_medium/core/user_connection.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static String id = 'chatpage/';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  User? loggedinUser;
  String messageText = '';
  Stream<List<Map<String, dynamic>>>? messages;

  void getCurrentUser() {
    try {
      final User? user = UserConnection().getCurrentUser();
      if (user != null) {
        loggedinUser = user;
      } else {
        Navigator.pop(context);
      }
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      print(e);
    }
  }

  void getStreamMessage() async {
    await for (var snapshots
        in FirebaseFirestore.instance.collection('messages').snapshots()) {
      for (var message in snapshots.docs) {
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: Text(
          '⚡️Chat',
          style: TextStyles.mlBold,
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
              onPressed: () async {
                getStreamMessage();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder(
              stream: MessageDb.streamMessage,
              builder: (context, snapshot) {
                List<Widget> messagesWidget = [];
                if (snapshot.hasData) {
                  final messages = snapshot.data!.docs;
                  for (var message in messages) {
                    final messageText = message.data()['text'];
                    final messageSender = message.data()['sender'];
                    final messageWidget =
                        Text('$messageText from $messageSender');
                    messagesWidget.add(messageWidget);
                  }
                }
                return Column(
                  children: messagesWidget,
                );
              }),
          Expanded(
            child: TextField(
              onChanged: (value) {
                messageText = value;
              },
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          TextButton(
            onPressed: () {
              MessageDb()
                  .sendMessage(text: messageText, sender: loggedinUser?.email);
            },
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
