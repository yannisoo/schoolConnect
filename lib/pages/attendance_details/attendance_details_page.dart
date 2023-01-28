import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/attendance/attendance_details/attendance_details_provider.dart';

class AttendanceDetailsPage extends ConsumerWidget {
  const AttendanceDetailsPage({
    @PathParam('id') required this.attendanceId,
    super.key,
  });
  final int attendanceId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendance = ref.watch(attendanceDetailsProvider(attendanceId));
    final attendanceController =
        ref.watch(attendanceDetailsProvider(attendanceId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: attendance.when(
          data: (o) => Text(o.lesson.module.subject),
          error: (e, s) => const Text('Error'),
          loading: CircularProgressIndicator.new,
        ),
      ),
      body: attendance.when(
        data: (o) => Column(
          children: [
            Text('${o.lesson.startsAt.toIso8601String()} - ${o.lesson.endsAt}'),
            Text(o.isPresent ? 'oui ' : 'non'),
            ElevatedButton(
              onPressed: attendanceController.setAttendance,
              child: const Text('Set attendance'),
            )
          ],
        ),
        error: (e, s) => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
