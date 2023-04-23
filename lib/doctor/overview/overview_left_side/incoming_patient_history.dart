import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class IncomingPatientHistory extends StatefulWidget {
  const IncomingPatientHistory({super.key});

  @override
  State<IncomingPatientHistory> createState() => _IncomingPatientHistoryState();
}

class _IncomingPatientHistoryState extends State<IncomingPatientHistory> {
  final List<Map<String, dynamic>> _tilesList = <Map<String, dynamic>>[
    <String, dynamic>{'visited': true, 'color': blue, 'icon': FontAwesomeIcons.user, 'title': "New Patients", 'number': 560, 'curve': <double>[]},
    <String, dynamic>{'visited': false, 'color': Colors.orange, 'icon': FontAwesomeIcons.suitcaseMedical, 'title': "Injections", 'number': 300, 'curve': <double>[]},
    <String, dynamic>{'visited': false, 'color': Colors.redAccent, 'icon': FontAwesomeIcons.heartPulse, 'title': "Surgery", 'number': 200, 'curve': <double>[]},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            const CustomText(text: "Incoming Patient History", fontSize: 20, fontWeight: FontWeight.bold),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    CustomText(text: "Monthly"),
                    SizedBox(width: 5),
                    Icon(FontAwesomeIcons.chevronDown, size: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(children: <Widget>[Expanded(child: Container(height: .5, color: grey))]),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return Column(
                  children: <Widget>[
                    for (final Map<String, dynamic> item in _tilesList)
                      GestureDetector(
                        onTap: () {
                          _(() {
                            for (final Map<String, dynamic> element in _tilesList) {
                              element["visited"] = false;
                            }
                            item["visited"] = true;
                          });
                        },
                        child: AnimatedContainer(
                          duration: 100.ms,
                          width: item["visited"] ? 225 : 220,
                          height: item["visited"] ? 85 : 80,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: grey, width: .5),
                            color: item["visited"] ? white : white.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CircleAvatar(backgroundColor: item["color"], radius: 20, child: Icon(item["icon"], color: white, size: 15)),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomText(text: item["title"], fontSize: 16, fontWeight: FontWeight.bold),
                                  const SizedBox(height: 5),
                                  CustomText(text: item["number"].toString(), fontSize: 14, color: item["color"]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            for (final Map<String, dynamic> item in const <Map<String, dynamic>>[
              <String, dynamic>{'color': blue, 'icon': FontAwesomeIcons.handHoldingHeart, 'title': "Consultations", 'number': 1032},
              <String, dynamic>{'color': Colors.redAccent, 'icon': FontAwesomeIcons.heartCircleCheck, 'title': "In Progress", 'number': 132},
              <String, dynamic>{'color': Colors.orange, 'icon': FontAwesomeIcons.pills, 'title': "In Review", 'number': 128},
            ])
              Container(
                margin: const EdgeInsets.only(right: 8.0),
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item["color"],
                  image: DecorationImage(image: const AssetImage("assets/pictures/ripples.png"), fit: const <BoxFit>[BoxFit.contain, BoxFit.cover][Random().nextInt(2)]),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: <BoxShadow>[BoxShadow(color: item["color"], blurRadius: 5, offset: const Offset(0, 1))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Icon(item["icon"], color: item["color"], size: 25)),
                    ),
                    const Spacer(),
                    CustomText(text: item["number"].toString(), fontSize: 16, color: white, fontWeight: FontWeight.bold),
                    const SizedBox(height: 5),
                    CustomText(text: item["title"], fontSize: 15, color: white),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
