import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat_medium/core/constants/constant.dart';

class MessageDb {
  final _fireStore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> get streamMessage =>
      FirebaseFirestore.instance.collection(messageCollectionPath).snapshots();

  void sendMessage({required String text, required String? sender}) {
    _fireStore
        .collection(messageCollectionPath)
        .add({'text': text, 'sender': sender});
  }

  Future<List<Map<String, dynamic>>> getMessages() async {
    final response = await _fireStore.collection(messageCollectionPath).get();
    List<Map<String, dynamic>> messages = [];
    for (var message in response.docs) {
      messages.add(message.data());
    }
    return messages;
  }

// TODO : function below is not work if places in different place
  // Future<Map<String, dynamic>?> getStreamMessages() async {
  //   await for (var snapshot
  //       in _fireStore.collection(messageCollectionPath).snapshots()) {
  //     for (var message in snapshot.docs) {
  //       return message.data();
  //     }
  //   }
  //   return null;
  // }
}
