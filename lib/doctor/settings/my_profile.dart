import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CustomText(text: "My Profile", fontWeight: FontWeight.bold, fontSize: 20),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              const CircleAvatar(backgroundColor: blue, radius: 35, backgroundImage: AssetImage("assets/pictures/hafedh.jpeg")),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CustomText(text: "Hafedh Gunichi", fontWeight: FontWeight.bold, fontSize: 18),
                  SizedBox(height: 5),
                  CustomText(text: "Team Manager", fontSize: 16, color: grey),
                  SizedBox(height: 5),
                  CustomText(text: "Leeds, United Kingdom", fontSize: 14, color: grey),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white, border: Border.all(width: .3, color: grey)),
                  child: Row(
                    children: const <Widget>[
                      CustomText(text: "Edit", color: grey, fontSize: 14),
                      SizedBox(width: 5),
                      Icon(FontAwesomeIcons.pencil, size: 15, color: grey),
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
