import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class BookingRate extends StatefulWidget {
  const BookingRate({super.key});

  @override
  State<BookingRate> createState() => _BookingRateState();
}

class _BookingRateState extends State<BookingRate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            const CustomText(text: "Booking Rate", fontSize: 20, fontWeight: FontWeight.bold),
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
            SizedBox(
              width: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomText(text: "58%", fontSize: 35, fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(5)),
                        child: const Center(child: Icon(FontAwesomeIcons.userCheck, size: 15, color: white)),
                      ),
                      const SizedBox(width: 5),
                      const Expanded(child: CustomText(text: "Your total patients on friday", isCentered: false, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(children: <Widget>[Expanded(child: Container(height: .5, color: grey, width: 200))]),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      CircleAvatar(radius: 15, backgroundColor: blue, child: Center(child: Icon(FontAwesomeIcons.chartLine, size: 15, color: white))),
                      SizedBox(width: 5),
                      CustomText(text: "6%", fontSize: 16),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomText(text: "Your booking rate is 6% increase than previous day.", isCentered: false, fontSize: 16, color: grey),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
