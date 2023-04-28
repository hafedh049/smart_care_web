import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/doctor/overview/overview_right_side/appointment_card.dart';
import 'package:smart_care_v2/doctor/overview/overview_right_side/profile_card.dart';
import 'package:smart_care_v2/doctor/overview/overview_right_side/your_income_card.dart';

class OverViewRightSide extends StatelessWidget {
  const OverViewRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: const <Widget>[
                        CircleAvatar(backgroundColor: welcomeWhite, radius: 20, child: Icon(FontAwesomeIcons.solidBell, color: grey, size: 20)),
                        CircleAvatar(backgroundColor: Colors.red, radius: 8, child: CustomText(text: "1", color: white, fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            CircleAvatar(radius: 15, backgroundImage: AssetImage("assets/pictures/hafedh.jpeg")),
                            SizedBox(width: 10),
                            CustomText(text: "Dr John Adam", fontSize: 14, fontWeight: FontWeight.bold),
                            SizedBox(width: 10),
                            Icon(FontAwesomeIcons.chevronDown, size: 15),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(children: const <Widget>[Expanded(child: ProfileCard())]),
              const SizedBox(height: 20),
              const YourIncome(),
              const SizedBox(height: 20),
              const AppointmentCard(),
            ],
          ),
        ),
      ],
    );
  }
}
