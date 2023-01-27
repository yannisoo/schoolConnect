import 'package:flutter/material.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LessonListDataSource extends CalendarDataSource<List<LessonList>> {
  LessonListDataSource(List<LessonList> lessons) {
    appointments = lessons;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments?[index].startsAt as DateTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endsAt as DateTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].module.subject as String;
  }

  @override
  Color getColor(int index) {
    return Colors.deepPurple;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
