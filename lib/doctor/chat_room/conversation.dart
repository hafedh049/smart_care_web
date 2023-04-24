import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:username/username.dart';

import '../../custom/globals.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final TextEditingController _searchController = TextEditingController();
  final List<bool> _usersConvs = <bool>[true, ...List.generate(29, (int index) => false)];
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
      decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
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
              builder: (BuildContext context, void Function(void Function()) _) {
                return ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    final String username = Username.en().fullname;
                    return GestureDetector(
                      onTap: () {
                        if (!_usersConvs[index]) {
                          for (int _ = 0; _ < 30; _++) {
                            _usersConvs[_] = false;
                          }
                          _(() => _usersConvs[index] = true);
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
                              alignment: AlignmentDirectional.topEnd,
                              children: <Widget>[
                                ProfilePicture(name: username, radius: 25, fontsize: 16, random: true, tooltip: true),
                                const CircleAvatar(radius: 5, backgroundColor: Colors.green),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomText(text: username, color: grey, fontSize: 16, fontWeight: FontWeight.bold),
                                const SizedBox(height: 5),
                                CustomText(text: messages[index], color: grey, fontSize: 14),
                              ],
                            ),
                            const Spacer(),
                            CustomText(text: times[index], color: grey, fontSize: 12),
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
