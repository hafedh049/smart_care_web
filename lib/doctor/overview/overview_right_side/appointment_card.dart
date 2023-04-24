import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/methods.dart';
import 'package:username/username.dart';

import '../../../custom/customs.dart';
import '../../../custom/globals.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> users = Username.en().getFullnames(count: 30);
    final List<String> times = generateTimingList();
    return Container(
      padding: const EdgeInsets.all(16),
      height: 400,
      decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              const CustomText(text: "Appointment", fontSize: 20, fontWeight: FontWeight.bold),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(width: .3, color: grey), color: white, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      CustomText(text: "View All"),
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
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) => Row(children: <Widget>[Expanded(child: Container(margin: const EdgeInsets.symmetric(vertical: 8.0), height: .5, color: grey))]),
              itemBuilder: (BuildContext context, int index) => Row(
                children: <Widget>[
                  ProfilePicture(name: users[index], radius: 25, fontsize: 16, random: true, tooltip: true),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomText(text: users[index], fontWeight: FontWeight.bold, fontSize: 14),
                      const SizedBox(height: 10),
                      CustomText(text: times[index], fontSize: 12, color: grey),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(color: blue.withOpacity(.3), borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(FontAwesomeIcons.arrowsToEye, color: blue, size: 15),
                          SizedBox(width: 10),
                          CustomText(text: "History", color: blue, fontSize: 14),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
