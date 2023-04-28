import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/doctor/appointment/appointment.dart';
import 'package:smart_care_v2/doctor/chat_room/chat_room.dart';
import 'package:smart_care_v2/doctor/overview/overview.dart';
import 'package:smart_care_v2/doctor/settings/account_settings.dart';
import 'package:smart_care_v2/small_screen/small_screen.dart';

import '../welcome/welcome.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({super.key});

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _items = <Map<String, dynamic>>[
    <String, dynamic>{"index": 0, "title": "Overview", "icon": FontAwesomeIcons.sitemap, "visited": true},
    <String, dynamic>{"index": 1, "title": "Profile", "icon": FontAwesomeIcons.user, "visited": false},
    <String, dynamic>{"index": 2, "title": "Appointments", "icon": FontAwesomeIcons.calendarDays, "visited": false},
    <String, dynamic>{"index": 3, "title": "Chats", "icon": FontAwesomeIcons.solidEnvelope, "visited": false},
  ];
  final PageController _pageController = PageController();
  bool _hideSidebar = false;

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 100.ms);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    if (mounted && _pageController.hasClients) {
      _pageController.jumpToPage(_pageController.page!.round());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxHeight > 800 && constraints.maxWidth > 1150) {
          return Scaffold(
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return AnimatedContainer(
                      duration: 300.ms,
                      width: _hideSidebar ? 70 : 200,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(color: dark, borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              _(() {
                                _hideSidebar = !_hideSidebar;
                                _hideSidebar ? _controller.forward() : _controller.reverse();
                              });
                            },
                            splashRadius: 5,
                            icon: AnimatedIcon(icon: AnimatedIcons.arrow_menu, progress: _animation, color: blue),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  CustomText(text: _hideSidebar ? "S" : "Smart", color: blue, fontWeight: FontWeight.bold, fontSize: 20),
                                  CustomText(text: _hideSidebar ? "C" : "Care", color: grey, fontWeight: FontWeight.bold, fontSize: 20),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          StatefulBuilder(
                            builder: (BuildContext context, void Function(void Function()) _) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  for (final Map<String, dynamic> item in _items)
                                    GestureDetector(
                                      onTap: () {
                                        _(() {
                                          for (Map<String, dynamic> element in _items) {
                                            element["visited"] = false;
                                          }
                                          item["visited"] = true;
                                          _pageController.jumpToPage(item["index"]);
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: 300.ms,
                                        width: _hideSidebar ? 75 : 150,
                                        padding: const EdgeInsets.all(8.0),
                                        margin: const EdgeInsets.only(bottom: 8.0),
                                        decoration: BoxDecoration(color: item["visited"] ? blue : welcomeWhite, borderRadius: BorderRadius.circular(5)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(item["icon"], color: item["visited"] ? white : grey, size: 20),
                                            if (!_hideSidebar) const SizedBox(width: 10.0),
                                            if (!_hideSidebar) Expanded(child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: CustomText(text: item["title"], color: item["visited"] ? white : grey, fontSize: 14, fontWeight: FontWeight.bold))),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                          const Spacer(),
                          if (!_hideSidebar)
                            const SettingsStack()
                          else
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const Welcome()), (Route route) => false);
                                },
                                icon: const Icon(FontAwesomeIcons.chevronLeft, color: grey, size: 20),
                              ),
                            ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: const <Widget>[
                      OverView(),
                      AccountSettings(),
                      Appointment(),
                      ChatRoom(),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SmallScreen();
        }
      },
    );
  }
}
