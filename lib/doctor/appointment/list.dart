import 'package:flutter/material.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/custom/methods.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'examination.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.schedule,
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
