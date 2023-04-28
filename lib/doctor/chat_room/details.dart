// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.target});
  final Map<String, dynamic> target;

  @override
  Widget build(BuildContext context) {
    bool changeColorVisibility = false;
    bool searchMediaContentVisibility = true;
    bool photoVisibility = true;
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: dark, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 60),
            const Center(child: CircleAvatar(radius: 35, backgroundImage: AssetImage("assets/pictures/hafedh.jpeg"))),
            const SizedBox(height: 20),
            Center(child: CustomText(text: target["target"], color: welcomeWhite, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            for (final Map<String, dynamic> item in <Map<String, dynamic>>[
              {'text': 'Profile', 'icon': FontAwesomeIcons.user, 'callback': () {}},
              {'text': 'Video Call', 'icon': FontAwesomeIcons.video, 'callback': () {}},
              {'text': 'Voice Call', 'icon': FontAwesomeIcons.phone, 'callback': () {}},
            ])
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: item['callback'],
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(radius: 15, backgroundColor: dark, child: Icon(item["icon"], size: 15, color: welcomeWhite)),
                        const SizedBox(width: 20),
                        CustomText(text: item["text"], fontSize: 15, color: welcomeWhite),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(color: welcomeWhite, height: 0.3, thickness: 0.3),
                  const SizedBox(height: 20),
                ],
              ),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return GestureDetector(
                  onTap: () {
                    _(() => changeColorVisibility = !changeColorVisibility);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const CircleAvatar(radius: 15, backgroundColor: dark, child: Icon(FontAwesomeIcons.palette, size: 15, color: welcomeWhite)),
                          const SizedBox(width: 20),
                          const CustomText(text: "Change Color", fontSize: 15, color: welcomeWhite),
                          const SizedBox(width: 20),
                          AnimatedSwitcher(duration: 300.ms, child: Icon(!changeColorVisibility ? FontAwesomeIcons.chevronDown : FontAwesomeIcons.chevronUp, size: 15, color: welcomeWhite)),
                        ],
                      ),
                      AnimatedContainer(
                        duration: 300.ms,
                        height: changeColorVisibility ? 70 : 0,
                        child: GridView.count(
                          childAspectRatio: 1.5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 6,
                          shrinkWrap: true,
                          children: darkContrastColors
                              .map(
                                (Color e) => GestureDetector(
                                  onTap: () {
                                    chatKey.currentState!.setState(() {
                                      discussionBgColor = e;
                                    });
                                  },
                                  child: CircleAvatar(radius: 3, backgroundColor: e),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Divider(color: welcomeWhite, height: 0.3, thickness: 0.3),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const <Widget>[
                      CircleAvatar(radius: 15, backgroundColor: dark, child: Icon(FontAwesomeIcons.magnifyingGlass, size: 15, color: welcomeWhite)),
                      SizedBox(width: 20),
                      CustomText(text: "Search Conversation", fontSize: 15, color: welcomeWhite),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(color: welcomeWhite, height: 0.3, thickness: 0.3),
                const SizedBox(height: 20),
              ],
            ),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return GestureDetector(
                  onTap: () {
                    _(() => searchMediaContentVisibility = !searchMediaContentVisibility);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const CircleAvatar(radius: 15, backgroundColor: dark, child: Icon(FontAwesomeIcons.magnifyingGlass, size: 15, color: welcomeWhite)),
                          const SizedBox(width: 20),
                          const CustomText(text: "Search media content", fontSize: 15, color: welcomeWhite),
                          const SizedBox(width: 20),
                          AnimatedSwitcher(duration: 300.ms, child: Icon(searchMediaContentVisibility ? FontAwesomeIcons.chevronUp : FontAwesomeIcons.chevronDown, size: 15, color: welcomeWhite)),
                        ],
                      ),
                      AnimatedContainer(
                        duration: 300.ms,
                        height: searchMediaContentVisibility ? 120 : 0,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              for (final Map<String, dynamic> item in <Map<String, dynamic>>[
                                {'text': 'Photo', 'icon': FontAwesomeIcons.photoFilm, 'callback': () {}},
                                {'text': 'File', 'icon': FontAwesomeIcons.file, 'callback': () {}},
                                {'text': 'Link', 'icon': FontAwesomeIcons.link, 'callback': () {}},
                              ])
                                Padding(
                                  padding: const EdgeInsets.only(left: 48),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: item["callback"],
                                        child: Row(
                                          children: <Widget>[
                                            CircleAvatar(radius: 15, backgroundColor: dark, child: Icon(item["icon"], size: 15, color: welcomeWhite)),
                                            const SizedBox(width: 20),
                                            CustomText(text: item["text"], fontSize: 15, color: welcomeWhite),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Padding(padding: EdgeInsets.only(right: 48), child: Divider(color: welcomeWhite, height: 0.3, thickness: 0.3)),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return GestureDetector(
                  onTap: () {
                    _(() => photoVisibility = !photoVisibility);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const CircleAvatar(radius: 15, backgroundColor: dark, child: Icon(FontAwesomeIcons.image, size: 15, color: welcomeWhite)),
                          const SizedBox(width: 20),
                          const CustomText(text: "Pictures", fontSize: 15, color: welcomeWhite),
                          const SizedBox(width: 20),
                          AnimatedSwitcher(duration: 300.ms, child: Icon(!photoVisibility ? FontAwesomeIcons.chevronDown : FontAwesomeIcons.chevronUp, size: 15, color: welcomeWhite)),
                        ],
                      ),
                      AnimatedContainer(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        duration: 300.ms,
                        height: photoVisibility ? 200 : 0,
                        child: GridView.count(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          children: const <String>['1', '2', '3', '4', '5', '6']
                              .map(
                                (String e) => GestureDetector(
                                  onTap: () {},
                                  child: Container(width: 50, height: 50, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/pictures/$e.jpg"), fit: BoxFit.cover), borderRadius: BorderRadius.circular(15))),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
