import 'package:flutter/material.dart';
import 'package:smart_care_v2/doctor/appointment/examination.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../custom/customs.dart';
import '../../custom/globals.dart';
import '../../custom/methods.dart';

class CalendarAppointment extends StatefulWidget {
  const CalendarAppointment({super.key});

  @override
  State<CalendarAppointment> createState() => _CalendarAppointmentState();
}

class _CalendarAppointmentState extends State<CalendarAppointment> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.week,
      dataSource: MeetingDataSource(generateAppointments(20)),
      showDatePickerButton: true,
      selectionDecoration: BoxDecoration(border: Border.all(width: .3, color: blue)),
      onTap: (CalendarTapDetails calendarTapDetails) {
        if (calendarTapDetails.appointments != null && calendarTapDetails.appointments!.isNotEmpty) {
          final Appointment appointment = calendarTapDetails.appointments!.first;
          showDialog(context: context, builder: (BuildContext context) => AlertDialog(content: Examination(appointment: createAppointmentMap(appointment.startTime, appointment.endTime, appointment.subject))));
        }
      },
      showNavigationArrow: true,
      showWeekNumber: true,
      allowDragAndDrop: true,
      allowAppointmentResize: true,
      allowViewNavigation: true,
    );
  }
}
