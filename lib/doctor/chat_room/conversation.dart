import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/methods.dart';

import '../../custom/globals.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key, required this.users});
  final List<Map<String, dynamic>> users;
  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final TextEditingController _searchController = TextEditingController();
  final List<bool> _usersConvs = <bool>[true, ...List.generate(userMessages.length - 1, (int index) => false)];
  final GlobalKey _searchKey = GlobalKey();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const CustomText(text: "Conversations", color: grey, fontWeight: FontWeight.bold),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(border: Border.all(width: 0.5, color: grey), borderRadius: BorderRadius.circular(10)),
                  child: const Icon(FontAwesomeIcons.ellipsisVertical, color: grey, size: 15),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: grey, height: 0.5, thickness: 0.5),
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            cursorColor: grey,
            onChanged: (String value) {
              _searchKey.currentState!.setState(() {});
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(borderSide: BorderSide(color: grey, width: 0.5)),
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: grey, width: 0.5)),
              hintText: 'Search here',
              hintStyle: GoogleFonts.roboto(color: grey, fontSize: 16),
              prefixIcon: const Icon(Icons.search, size: 20, color: grey),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: StatefulBuilder(
              key: _searchKey,
              builder: (BuildContext context, void Function(void Function()) _) {
                final List<Map<String, dynamic>> filteredList = widget.users.where((Map<String, dynamic> element) => element["target"].toLowerCase().contains(_searchController.text.trim().toLowerCase())).toList();
                return ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (!_usersConvs[index]) {
                          for (int _ = 0; _ < userMessages.length; _++) {
                            _usersConvs[_] = false;
                          }
                          _(() => _usersConvs[index] = true);
                          detailsKey.currentState!.setState(() => chatKey.currentState!.setState(() => discussionIndex = index));
                        }
                      },
                      child: AnimatedContainer(
                        duration: 300.ms,
                        width: _usersConvs[index] ? 284 : 280,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: !_usersConvs[index] ? Border.all(color: grey, width: 0.1) : null,
                          color: _usersConvs[index] ? blue.withOpacity(.1) : null,
                        ),
                        child: Row(
                          children: <Widget>[
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: <Widget>[
                                ProfilePicture(name: filteredList[index]["target"], radius: 25, fontsize: 16, tooltip: true),
                                CircleAvatar(radius: 5, backgroundColor: filteredList[index]["state"] ? Colors.green : Colors.red),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SingleChildScrollView(scrollDirection: Axis.horizontal, child: CustomText(text: filteredList[index]["target"], color: grey, fontSize: 16, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 5),
                                  SingleChildScrollView(scrollDirection: Axis.horizontal, child: CustomText(text: filteredList[index]["lastMessage"]["text"], color: grey, fontSize: 14)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomText(text: formatMessageDate(filteredList[index]["lastMessage"]["timestamp"]), color: grey, fontSize: 12),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
