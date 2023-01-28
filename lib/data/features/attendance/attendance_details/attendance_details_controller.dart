import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/attendance/attendance_details/attendance_details_model.dart';
import 'package:school_app/data/features/attendance/attendance_details/attendance_details_repository.dart';

class AttendanceDetailsController
    extends StateNotifier<AsyncValue<AttendanceDetails>> {
  AttendanceDetailsController({
    required this.repository,
    required this.id,
  }) : super(const AsyncValue.loading()) {
    getAttendanceDetails();
  }
  final AttendanceDetailsRepository repository;
  final int id;

  Future<void> getAttendanceDetails() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await repository.getAttendanceDetails(id));
  }

  Future<void> setAttendance() async {
    await repository.setAttendance(id);
    state = AsyncData(state.value!.copyWith(isPresent: true));
  }
}
