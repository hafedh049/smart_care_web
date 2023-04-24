import 'package:flutter/material.dart';

import 'conversation.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Conversations(),
      ],
    );
  }
}
