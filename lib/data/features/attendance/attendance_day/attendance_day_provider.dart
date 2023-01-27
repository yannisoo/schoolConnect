import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/providers.dart';
import 'package:school_app/data/features/attendance/attendance_day/attendance_day_controller.dart';
import 'package:school_app/data/features/attendance/attendance_day/attendance_day_model.dart';
import 'package:school_app/data/features/attendance/attendance_day/attendance_day_repository.dart';

final attendanceDayRepositoryProvider =
    Provider<AttendanceDayRepository>((ref) {
  return AttendanceDayRepository(
    client: ref.watch(supabaseClientProvider),
  );
});

final attendanceDayProvider = StateNotifierProvider.autoDispose<
    AttendanceDayController, AsyncValue<List<AttendanceDay>>>((ref) {
  final repo = ref.watch(attendanceDayRepositoryProvider);
  return AttendanceDayController(repository: repo);
});
