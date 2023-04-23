import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/doctor/overview/overview_left_side/booking_rate.dart';
import 'package:smart_care_v2/doctor/overview/overview_left_side/incoming_patient_history.dart';
import 'package:smart_care_v2/doctor/overview/overview_left_side/my_schedule.dart';

class OverViewLeftSide extends StatefulWidget {
  const OverViewLeftSide({super.key});

  @override
  State<OverViewLeftSide> createState() => _OverViewLeftSideState();
}

class _OverViewLeftSideState extends State<OverViewLeftSide> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(border: Border.all(width: .5, color: grey), color: welcomeWhite, borderRadius: BorderRadius.circular(10.0)),
            child: TextFormField(decoration: const InputDecoration(hintText: 'Search', prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass, color: grey, size: 20), border: InputBorder.none)),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(10.0)),
            child: const IncomingPatientHistory(),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(10.0)),
            child: const BookingRate(),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(10.0)),
            child: const MySchedule(),
          ),
        ],
      ),
    );
  }
}
