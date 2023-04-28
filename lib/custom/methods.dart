import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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

String formatMessageDate(DateTime date) {
  return "${date.hour}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'PM' : 'AM'}";
}

List<Appointment> generateAppointments(int count) {
  List<Appointment> appointments = [];
  DateTime now = DateTime.now();
  DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  Random random = Random();
  List<String> subjects = ['Meeting', 'Presentation', 'Lunch', 'Appointment', 'Interview', 'Workshop', 'Conference', 'Training', 'Webinar'];

  for (int i = 0; i < count; i++) {
    DateTime startTime;
    DateTime endTime;
    String subject;
    bool overlapping = false;

    do {
      startTime = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day + random.nextInt(7), random.nextInt(10) + 8, random.nextInt(60)); // generate random minutes within the hour
      endTime = startTime.add(Duration(hours: random.nextInt(4) + 1)); // generate random appointment duration between 1 and 4 hours
      subject = subjects[random.nextInt(subjects.length)];

      overlapping = appointments.any((appointment) => appointment.startTime.year == startTime.year && appointment.startTime.month == startTime.month && appointment.startTime.day == startTime.day && appointment.startTime.isBefore(endTime) && appointment.endTime.isAfter(startTime));
    } while (overlapping);

    String notes = 'Notes for appointment $i';
    Color color = _generateRandomColorWithContrast();
    Appointment appointment = Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: subject,
      notes: notes,
      color: color,
    );
    appointments.add(appointment);
  }

  return appointments;
}

Color _generateRandomColorWithContrast() {
  final Random random = Random();
  // ensure a minimum value of 55 for contrast
  final int red = random.nextInt(200) + 55;
  final int green = random.nextInt(200) + 55;
  final int blue = random.nextInt(200) + 55;
  return Color.fromARGB(255, red, green, blue);
}

Map<String, dynamic> createAppointmentMap(DateTime startTime, DateTime endTime, String subject) {
  // Format date in "d MMM yyy" format
  final dateFormatter = DateFormat('d MMM yyy');
  final date = dateFormatter.format(startTime);

  // Format time in "HH:mm - HH:mm" format
  final timeFormatter = DateFormat('HH:mm');
  final time = '${timeFormatter.format(startTime)} - ${timeFormatter.format(endTime)}';

  // Calculate duration in minutes
  final duration = endTime.difference(startTime).inMinutes;

  // Create the appointment map
  final appointmentMap = {
    'date': date,
    'time': time,
    'service': subject,
    'duration': "$duration min",
  };

  return appointmentMap;
}
