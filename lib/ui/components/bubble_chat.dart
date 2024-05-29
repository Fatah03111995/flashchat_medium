import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  final String text;
  final String sender;

  const BubbleChat({
    super.key,
    required this.sender,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlue,
        boxShadow: [
          BoxShadow(
              color: Colors.lightBlue.withOpacity(0.7),
              offset: const Offset(0, 3),
              blurRadius: 1),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                sender,
                style: TextStyles.senderBubble,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyles.textBubble,
          ),
        ],
      ),
    );
  }
}
