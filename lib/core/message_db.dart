import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat_medium/core/constants/constant.dart';

class MessageDb {
  final _fireStore = FirebaseFirestore.instance;

  void sendMessage({required String text, required String? sender}) {
    _fireStore
        .collection(messageCollectionPath)
        .add({'text': text, 'sender': sender});
  }
}
