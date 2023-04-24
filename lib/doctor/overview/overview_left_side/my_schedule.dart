import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class MySchedule extends StatelessWidget {
  const MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            const CustomText(text: "My Schedule", fontSize: 20, fontWeight: FontWeight.bold),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(border: Border.all(width: .3, color: grey), color: white, borderRadius: BorderRadius.circular(5)),
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12.0),
          decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (int day = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 5).day; day <= DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 5).day; day++)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: day == DateTime.now().day ? blue : white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(radius: 20, backgroundColor: white, child: CustomText(text: day.toString(), fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        CustomText(text: weekDays[DateTime(DateTime.now().year, DateTime.now().month, day).weekday - 1]!, fontSize: 14, color: day == DateTime.now().day ? white : grey),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 100),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        for (final Map<String, dynamic> item in const <Map<String, dynamic>>[
                          <String, dynamic>{"color": blue, "place": "Aspirus Hospital", "time": "8:00 AM - 10:00 AM", "icon": FontAwesomeIcons.staffSnake},
                          <String, dynamic>{"color": Colors.redAccent, "place": "Bon secure st", "time": "2:00 PM - 04:00 PM", "icon": FontAwesomeIcons.pills},
                          <String, dynamic>{"color": Colors.amber, "place": "Mayo Clinic", "time": "05:00 PM - 07:00 PM", "icon": FontAwesomeIcons.handHoldingMedical},
                        ])
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HatchedContainer(
                              color: item["color"],
                              widget: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: 5,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: item["color"],
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  CircleAvatar(radius: 25, backgroundColor: white, child: Icon(item["icon"], color: item["color"], size: 25)),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      CustomText(text: item["place"], fontSize: 16, fontWeight: FontWeight.bold, color: item["color"]),
                                      const SizedBox(height: 10),
                                      CustomText(text: item["time"], fontSize: 16, color: item["color"]),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
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
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CustomText(text: "08:00 AM", fontSize: 16, color: grey),
                  const SizedBox(width: 10),
                  const CircleAvatar(radius: 5, backgroundColor: blue),
                  Expanded(child: Container(height: 1, color: blue)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
