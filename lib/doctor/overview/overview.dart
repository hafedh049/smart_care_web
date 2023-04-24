import 'package:flutter/material.dart';
import 'package:smart_care_v2/doctor/overview/overview_left_side/overview_left_side.dart';
import 'package:smart_care_v2/doctor/overview/overview_right_side/overview_right_side.dart';

class OverView extends StatelessWidget {
  const OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(child: OverViewLeftSide()),
        const SizedBox(width: 20),
        Container(padding: const EdgeInsets.all(8.0), width: 400, child: const OverViewRightSide()),
      ],
    );
  }
}
