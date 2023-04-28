import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/doctor/chat_room/chats.dart';
import 'package:smart_care_v2/doctor/chat_room/details.dart';
import 'package:username/username.dart';

import 'conversation.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  void initState() {
    for (Map<String, dynamic> item in userMessages) {
      item["target"] = Username.en().fullname;
      item["state"] = Random().nextBool();

      item["avatar"] = Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          ProfilePicture(name: item["target"], radius: 25, fontsize: 16, tooltip: true),
          CircleAvatar(radius: 5, backgroundColor: item["state"] ? Colors.green : Colors.red),
        ],
      );
      item["messages"].sort((Map<String, dynamic> a, Map<String, dynamic> b) => a["timestamp"].millisecondsSinceEpoch > b["timestamp"].millisecondsSinceEpoch ? 1 : -1);
      item["lastMessage"] = item["messages"].last;
    }
    userMessages.sort((Map<String, dynamic> a, Map<String, dynamic> b) => a["lastMessage"]["timestamp"].millisecondsSinceEpoch > b["lastMessage"]["timestamp"].millisecondsSinceEpoch ? 1 : -1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        StatefulBuilder(
          key: conversationKey,
          builder: (BuildContext context, void Function(void Function()) _) {
            return Conversations(users: userMessages);
          },
        ),
        Expanded(
          child: StatefulBuilder(
            key: chatKey,
            builder: (BuildContext context, void Function(void Function()) _) {
              return Chats(target: userMessages[discussionIndex]);
            },
          ),
        ),
        StatefulBuilder(
          key: detailsKey,
          builder: (BuildContext context, void Function(void Function()) _) {
            return Details(target: userMessages[discussionIndex]);
          },
        ),
      ],
    );
  }
}
