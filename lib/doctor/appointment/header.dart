// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = <Map<String, dynamic>>[
      {'text': 'List', 'state': false},
      {'text': 'Calendar', 'state': true},
    ];
    return Row(
      children: <Widget>[
        const CustomText(text: "Appointments", fontSize: 18, fontWeight: FontWeight.bold),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(5)),
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) _) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final Map<String, dynamic> item in items)
                    GestureDetector(
                      onTap: () {
                        if (!item["state"]) {
                          _(() {
                            for (final Map<String, dynamic> it in items) {
                              it["state"] = false;
                            }
                            item["state"] = true;
                          });
                          appointmentTypeIsCalendar = item["text"] == "Calendar" ? 1 : 0;
                          calendarKey.currentState!.setState(() {});
                        }
                      },
                      child: AnimatedContainer(
                        padding: const EdgeInsets.all(8),
                        duration: 300.ms,
                        decoration: BoxDecoration(color: item["state"] ? white : welcomeWhite, borderRadius: BorderRadius.circular(5)),
                        child: Center(child: CustomText(text: item["text"], fontSize: 14, color: item["state"] ? blue : grey)),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(5)),
            width: 50,
            height: 40,
            child: const Center(child: Icon(FontAwesomeIcons.plus, size: 15, color: white)),
          ),
        )
      ],
    );
  }
}
