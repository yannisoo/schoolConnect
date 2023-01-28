import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/router/app_router.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_model.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_provider.dart';
import 'package:school_app/data/features/lessons/utils/lessons_list_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LessonListPage extends ConsumerWidget {
  const LessonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonListProvider);
    return lessons.when(
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
    );
  }
}
