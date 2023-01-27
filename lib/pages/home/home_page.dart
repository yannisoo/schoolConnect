import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/router/app_router.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_model.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_provider.dart';
import 'package:school_app/data/features/lessons/utils/lessons_list_data_source.dart';

import 'package:school_app/utils/date_formatter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends ConsumerWidget with DateFormatter {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonListProvider);
    return Scaffold(
      appBar: AppBar(
        title: lessons.when(
          data: (o) => const Text(
            'Home',
          ),
          error: (e, s) => const Text('Error'),
          loading: CircularProgressIndicator.new,
        ),
      ),
      body: lessons.when(
        data: (data) => SfCalendar(
          view: CalendarView.week,
          dataSource: LessonListDataSource(data),
          timeSlotViewSettings: const TimeSlotViewSettings(
            timeInterval: Duration(minutes: 30),
            timeFormat: 'HH:mm',
            startHour: 7,
            endHour: 20,
          ),
          onTap: (CalendarTapDetails details) async {
            if (details.targetElement == CalendarElement.appointment) {
              final lesson = details.appointments![0] as LessonList;
              await AutoRouter.of(context).push(
                LessonDetailsPageRoute(
                  lessonId: lesson.id,
                ),
              );
            }
          },
        ),
        error: (error, stackTrace) => const CircularProgressIndicator(),
        loading: () => const CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) async {
          switch (index) {
            case 0:
              break;
            case 1:
              await AutoRouter.of(context).push(const AttendancePageRoute());
              break;
            case 2:
              await AutoRouter.of(context).push(const AttendancePageRoute());
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Presence',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
