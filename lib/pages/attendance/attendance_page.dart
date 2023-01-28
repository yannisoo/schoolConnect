import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/attendance/attendance_day/attendance_day_provider.dart';
import 'package:school_app/utils/date_formatter.dart';

class AttendancePage extends ConsumerWidget with DateFormatter {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendance = ref.watch(attendanceDayProvider);
    return attendance.when(
      data: (data) => ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index].lesson.module.subject),
            subtitle: Text(
              'starts ${format(data[index].lesson.startsAt)}',
            ),
          );
        },
        itemCount: data.length,
      ),
      error: (error, stackTrace) => const CircularProgressIndicator(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
