import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/methods.dart';
import 'package:smart_care_v2/doctor/chat_room/send.dart';

import '../../custom/customs.dart';
import '../../custom/globals.dart';

class Chats extends StatefulWidget {
  const Chats({super.key, required this.target});
  final Map<String, dynamic> target;

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey _listKey = GlobalKey();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = widget.target["messages"];
    return Container(
      padding: const EdgeInsets.all(16),
      color: discussionBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(alignment: AlignmentDirectional.bottomEnd, children: <Widget>[const CircleAvatar(radius: 15, backgroundImage: AssetImage("assets/pictures/hafedh.jpeg")), CircleAvatar(backgroundColor: widget.target["state"] ? Colors.green : Colors.red, radius: 5)]),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: <Widget>[CustomText(text: widget.target["target"], fontWeight: FontWeight.bold), CustomText(text: widget.target["state"] ? "Actif now" : "Offline", color: grey, fontSize: 12)]),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(width: 20, height: 20, decoration: const BoxDecoration(color: welcomeWhite), child: const Icon(FontAwesomeIcons.phone, size: 15)),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Container(width: 20, height: 20, decoration: const BoxDecoration(color: welcomeWhite), child: const Icon(FontAwesomeIcons.video, size: 15)),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Container(width: 20, height: 20, decoration: const BoxDecoration(color: welcomeWhite), child: const Icon(FontAwesomeIcons.ellipsisVertical, size: 15)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: grey, height: 0.5, thickness: 0.5),
          const SizedBox(height: 10),
          Expanded(
            child: StatefulBuilder(
              key: _listKey,
              builder: (BuildContext context, void Function(void Function()) _) {
                return ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12, left: chats[index]["me"] ? 24 : 0, right: !chats[index]["me"] ? 24 : 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: chats[index]["me"] ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: <Widget>[
                          if (!chats[index]["me"]) const CircleAvatar(radius: 25, backgroundColor: blue, backgroundImage: AssetImage("assets/pictures/hafedh.jpeg")),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Tooltip(
                              message: formatMessageDate(chats[index]["timestamp"]),
                              child: Bubble(
                                margin: const BubbleEdges.only(bottom: 10),
                                color: chats[index]["me"] ? white : blue,
                                borderWidth: 1,
                                showNip: true,
                                nip: chats[index]["me"] ? BubbleNip.rightTop : BubbleNip.leftTop,
                                child: CustomText(text: chats[index]["text"], color: chats[index]["me"] ? grey : white, isCentered: false),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: grey, width: 1), borderRadius: BorderRadius.circular(15), color: white),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: <Widget>[
                Send(callback: () {}, icon: FontAwesomeIcons.microphone),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(border: InputBorder.none, hintText: 'Type your message here...'),
                    onSubmitted: (String value) {
                      if (_messageController.text.trim().isNotEmpty) {
                        DateTime now = DateTime.now();
                        conversationKey.currentState!.setState(() {
                          widget.target["messages"].add(<String, dynamic>{'text': _messageController.text.trim(), 'timestamp': now, 'me': true});
                          widget.target["messages"].sort((Map<String, dynamic> a, Map<String, dynamic> b) => a["timestamp"].millisecondsSinceEpoch > b["timestamp"].millisecondsSinceEpoch ? 1 : -1);
                          widget.target["lastMessage"] = <String, dynamic>{'text': _messageController.text.trim(), 'timestamp': now};
                        });
                        _listKey.currentState!.setState(() {});
                        _messageController.clear();
                      }
                    },
                  ),
                ),
                for (final Map<String, dynamic> item in <Map<String, dynamic>>[
                  {'icon': FontAwesomeIcons.camera, 'callback': () {}},
                  {'icon': FontAwesomeIcons.solidFaceSmile, 'callback': () {}},
                  {
                    'icon': FontAwesomeIcons.paperPlane,
                    'callback': () {
                      if (_messageController.text.trim().isNotEmpty) {
                        DateTime now = DateTime.now();
                        conversationKey.currentState!.setState(() {
                          widget.target["messages"].add(<String, dynamic>{'text': _messageController.text.trim(), 'timestamp': now, 'me': true});
                          widget.target["messages"].sort((Map<String, dynamic> a, Map<String, dynamic> b) => a["timestamp"].millisecondsSinceEpoch > b["timestamp"].millisecondsSinceEpoch ? 1 : -1);
                          widget.target["lastMessage"] = <String, dynamic>{'text': _messageController.text.trim(), 'timestamp': now};
                        });
                        _listKey.currentState!.setState(() {});
                        _messageController.clear();
                      }
                    }
                  },
                  {'icon': FontAwesomeIcons.locationDot, 'callback': () {}},
                ])
                  Send(callback: item["callback"], icon: item["icon"]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
