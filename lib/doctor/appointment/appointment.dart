import 'package:flutter/material.dart';
import 'package:smart_care_v2/doctor/appointment/choice.dart.dart';
import 'package:smart_care_v2/doctor/appointment/header.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Header(),
          SizedBox(height: 20),
          Divider(thickness: .3, height: .5),
          SizedBox(height: 20),
          Expanded(child: Schedule()),
        ],
      ),
    );
  }
}
