import 'package:flutter/material.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/doctor/appointment/calendar.dart';
import 'package:smart_care_v2/doctor/appointment/list.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(16),
      child: StatefulBuilder(
        key: calendarKey,
        builder: (BuildContext context, void Function(void Function()) _) {
          return appointmentTypeIsCalendar == 1 ? const CalendarAppointment() : const AppointmentList();
        },
      ),
    );
  }
}
