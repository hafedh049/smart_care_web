import 'package:flutter/material.dart';
import 'package:smart_care_v2/doctor/overview/overview_left_side/overview_left_side.dart';
import 'package:smart_care_v2/doctor/overview/overview_right_side.dart';

import '../../custom/globals.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(child: OverViewLeftSide()),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
          width: 200,
          child: const OverViewRightSide(),
        ),
      ],
    );
  }
}
