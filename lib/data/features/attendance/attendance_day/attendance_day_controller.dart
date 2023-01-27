import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/attendance/attendance_day/attendance_day_model.dart';
import 'package:school_app/data/features/attendance/attendance_day/attendance_day_repository.dart';

class AttendanceDayController
    extends StateNotifier<AsyncValue<List<AttendanceDay>>> {
  AttendanceDayController({
    required this.repository,
  }) : super(const AsyncValue.loading()) {
    getAttendanceDay();
  }
  final AttendanceDayRepository repository;

  Future<void> getAttendanceDay() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await repository.getAttendanceDay());
  }
}
