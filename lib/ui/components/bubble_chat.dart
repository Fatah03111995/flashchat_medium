import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BubbleChat extends StatelessWidget {
  final String text;
  final String sender;
  final DateTime? dateTime;
  final bool isMe;

  const BubbleChat(
      {super.key,
      required this.sender,
      required this.text,
      this.dateTime,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    List<Widget> contains = [
      Text(
        sender,
        style: TextStyles.senderBubble,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(20),
              bottomRight: const Radius.circular(20),
              topLeft:
                  isMe ? const Radius.circular(0) : const Radius.circular(20),
              topRight:
                  isMe ? const Radius.circular(20) : const Radius.circular(0)),
          color: isMe ? Colors.white : Colors.lightBlue,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: const Offset(0, 2),
                blurRadius: 2),
          ],
        ),
        child: Text(
          text,
          style: isMe ? TextStyles.textBubbleIsMe : TextStyles.textBubble,
        ),
      ),
    ];

    if (dateTime != null) {
      final formattedDate = DateFormat.jm().format(dateTime!);
      contains.add(Text(
        formattedDate,
        style: TextStyles.dateBubble,
      ));
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: contains,
      ),
    );
  }
}
