import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../custom/customs.dart';
import '../../../custom/globals.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: welcomeWhite,
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(image: AssetImage("assets/pictures/ripples.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 30,
            backgroundColor: grey,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: white,
              child: CircleAvatar(radius: 25, backgroundImage: AssetImage("assets/pictures/hafedh.jpeg")),
            ),
          ),
          const SizedBox(height: 20),
          const CustomText(text: "Dr John Adam", fontSize: 16, fontWeight: FontWeight.bold),
          const SizedBox(height: 10),
          const CustomText(text: "Medicine Specialist", fontSize: 12, color: grey),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final Map<String, dynamic> item in <Map<String, dynamic>>[
                const <String, dynamic>{"color": blue, "title": "Workload", "subtitle": "16 Patients", "icon": FontAwesomeIcons.briefcaseMedical},
                const <String, dynamic>{"color": Colors.redAccent, "title": "Available", "subtitle": "17 / 60 slots", "icon": FontAwesomeIcons.calendar},
                <String, dynamic>{"color": Colors.amber.shade900, "title": "E-mail", "subtitle": "21", "icon": FontAwesomeIcons.envelope},
              ])
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 108,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: item["color"].withOpacity(.3), borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircleAvatar(radius: 25, backgroundColor: item["color"], child: Icon(item["icon"], color: white, size: 25)),
                        const SizedBox(height: 10),
                        CustomText(text: item["title"], fontSize: 14, fontWeight: FontWeight.bold, color: item["color"]),
                        const SizedBox(height: 10),
                        CustomText(text: item["subtitle"], fontSize: 14, color: item["color"]),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
