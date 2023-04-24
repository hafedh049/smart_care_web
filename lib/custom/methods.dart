import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showToast({required String text}) {
  Fluttertoast.showToast(msg: text, fontSize: 20, webPosition: "right", webBgColor: "rgb(109, 169, 228)", webShowClose: true, timeInSecForIosWeb: 3);
}

void goToPage(Widget page) {
  Get.to(page, duration: 200.ms, transition: Transition.values[Random().nextInt(Transition.values.length)]);
}

List<String> generateTimingList() {
  final DateTime now = DateTime.now();
  final DateTime startTime = DateTime(now.year, now.month, now.day, 10, 0, 0);
  final DateTime endTime = DateTime(now.year, now.month, now.day, 17, 0, 0);
  final List<int> durationMin = <int>[20, 25, 30, 35, 40, 45];

  final List<String> timingList = <String>[];
  DateTime currentStartTime = startTime;

  for (int i = 0; i < 30; i++) {
    final random = Random();
    final duration = durationMin[random.nextInt(durationMin.length)];

    DateTime currentEndTime = currentStartTime.add(Duration(minutes: duration));

    if (currentEndTime.isAfter(endTime)) {
      currentStartTime = startTime;
      currentEndTime = currentStartTime.add(Duration(minutes: duration));
    }

    final String appointmentTiming = '${currentStartTime.hour}:${currentStartTime.minute.toString().padLeft(2, '0')} '
        '${currentStartTime.hour >= 12 ? 'PM' : 'AM'} - $duration min';

    timingList.add(appointmentTiming);

    currentStartTime = currentEndTime;
  }

  return timingList;
}
