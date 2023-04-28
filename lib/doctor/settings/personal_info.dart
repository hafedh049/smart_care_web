import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../custom/customs.dart';
import '../../custom/globals.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomText(text: "Personal Information", fontWeight: FontWeight.bold, fontSize: 20),
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
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CustomText(text: "First Name", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "Hafedh", fontSize: 16, fontWeight: FontWeight.bold),
                  SizedBox(height: 20),
                  CustomText(text: "Email Address", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "hafedhgunichi@gmail.com", fontSize: 16, fontWeight: FontWeight.bold),
                  SizedBox(height: 20),
                  CustomText(text: "Bio", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "Team Manager", fontSize: 16, fontWeight: FontWeight.bold),
                ],
              ),
              const SizedBox(width: 200),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CustomText(text: "Last Name", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "Gunichi", fontSize: 16, fontWeight: FontWeight.bold),
                  SizedBox(height: 20),
                  CustomText(text: "Phone", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "+216 23 566 502", fontSize: 16, fontWeight: FontWeight.bold),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
