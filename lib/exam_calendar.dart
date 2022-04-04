import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'exam.dart';

class CalendarScreen extends StatelessWidget {
  List<Exam> exams;

  CalendarScreen(this.exams);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Showing " + exams.length.toString() + " exam dates")),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource(exams)),
        monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            navigationDirection: MonthNavigationDirection.horizontal),
        todayHighlightColor: Colors.blue,
        showNavigationArrow: true,
        // on
      ),
    );
  }

  List<Meeting> _getDataSource(exams) {
    final List<Meeting> meetings = <Meeting>[];
    exams.forEach((exam) => {
          meetings.add(Meeting(
              exam.getName(),
              DateTime.parse(exam.getDate()),
              DateTime.parse(exam.getDate()),
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
              true))
        });
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
