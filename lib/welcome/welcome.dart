import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/auth/reset_account.dart';
import 'package:smart_care_v2/auth/sign_up.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/small_screen/small_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../auth/sign_in.dart';
import '../custom/methods.dart';

class Welcome extends StatefulWidget {
  const Welcome({key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<Map<String, dynamic>> _socialMedias = <Map<String, dynamic>>[
    const <String, dynamic>{'icon': FontAwesomeIcons.earthAmericas, 'color': Color.fromARGB(255, 10, 77, 104), 'url': 'www.google.com'},
    const <String, dynamic>{'icon': FontAwesomeIcons.facebook, 'color': blue, 'url': 'www.google.com'},
    const <String, dynamic>{'icon': FontAwesomeIcons.google, 'color': Colors.red, 'url': 'www.google.com'},
    const <String, dynamic>{'icon': FontAwesomeIcons.instagram, 'color': Color.fromARGB(255, 237, 198, 177), 'url': 'www.google.com'},
    const <String, dynamic>{'icon': FontAwesomeIcons.twitter, 'color': Color.fromARGB(255, 5, 191, 219), 'url': 'www.google.com'},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool _swap = false;

  @override
  Widget build(BuildContext context) {
    final Widget leftSide = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              const SizedBox(width: 50),
              Image.asset("assets/pictures/diamond.png", width: 25, height: 25),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () async => await FlutterClipboard.copy("Smart Care").then((void value) => showToast(text: "Application title copied to clipboard")),
                child: const CustomText(text: "Smart Care", fontSize: 24, fontWeight: FontWeight.bold, color: white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(child: Image.asset('assets/pictures/doctor.png')),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async => await FlutterClipboard.copy("Without good health, life's joys are muted, and its challenges magnified.").then((void value) => showToast(text: "Quote copied to clipboard")),
            child: const CustomText(text: "Without good health, life's joys are muted, and its challenges magnified.", fontSize: 18, fontWeight: FontWeight.bold, color: white),
          ),
          const SizedBox(height: 20),
        ],
      ).animate(target: _swap ? 0 : 1).slideX(duration: 300.ms, begin: 1, end: 0, curve: Curves.fastLinearToSlowEaseIn),
    );
    final Widget rightSide = Expanded(
      child: AnimatedContainer(
        duration: 300.ms,
        decoration: BoxDecoration(
          color: welcomeWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(!_swap ? 35 : 0),
            bottomLeft: Radius.circular(!_swap ? 35 : 0),
            topRight: Radius.circular(_swap ? 35 : 0),
            bottomRight: Radius.circular(_swap ? 35 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .8,
              width: MediaQuery.of(context).size.width / 2 * .8,
              decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _(() => _selectedIndex != 0 ? _selectedIndex = 0 : null);
                              _pageController.animateToPage(0, duration: 300.ms, curve: Curves.linear);
                              setState(() {
                                _swap = false;
                              });
                            },
                            child: CustomTab(tab: "Sign In", bold: true, selected: _selectedIndex == 0 ? true : false),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              _(() => _selectedIndex != 1 ? _selectedIndex = 1 : null);
                              _pageController.animateToPage(1, duration: 300.ms, curve: Curves.linear);
                              setState(() {
                                _swap = true;
                              });
                            },
                            child: CustomTab(tab: "Sign Up", bold: true, selected: _selectedIndex == 1 ? true : false),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              _(() => _selectedIndex != 2 ? _selectedIndex = 2 : null);
                              _pageController.animateToPage(2, duration: 300.ms, curve: Curves.linear);
                            },
                            child: CustomTab(tab: "Recover Account", bold: true, selected: _selectedIndex == 2 ? true : false),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: white),
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const <Widget>[SignInScreen(), SignUpScreen(), RecoveryAccountScreen()],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _socialMedias
                  .map(
                    (Map<String, dynamic> item) => Container(
                      margin: const EdgeInsets.all(8.0),
                      child: IconButton(onPressed: () => launchUrlString(item["url"]), icon: Icon(item["icon"], color: item["color"], size: 25)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(FontAwesomeIcons.phone),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async => await FlutterClipboard.copy("+216 23 566 502").then((void value) => showToast(text: "Phone number copied to clipboard")),
                  child: const CustomText(text: "+216 23 566 502"),
                ),
                const SizedBox(width: 30),
                const Icon(FontAwesomeIcons.solidEnvelopeOpen),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () async => await FlutterClipboard.copy("hafedhgunichi@gmail.com").then((void value) => showToast(text: "E-mail copied to clipboard")),
                  child: const CustomText(text: "hafedhgunichi@gmail.com"),
                ),
              ],
            ),
          ],
        ),
      ).animate(target: _swap ? 0 : 1).slideX(duration: 500.ms, begin: -1, end: 0, curve: Curves.fastLinearToSlowEaseIn),
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxHeight > 800 && constraints.maxWidth > 1150) {
          return Scaffold(body: Container(color: dark, child: Row(children: <Widget>[leftSide, rightSide])));
        } else {
          return const SmallScreen();
        }
      },
    );
  }
}
