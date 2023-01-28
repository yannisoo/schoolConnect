import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/providers.dart';
import 'package:school_app/data/features/attendance/attendance_details/attendance_details_controller.dart';
import 'package:school_app/data/features/attendance/attendance_details/attendance_details_model.dart';
import 'package:school_app/data/features/attendance/attendance_details/attendance_details_repository.dart';

final attendanceDetailsRepositoryProvider =
    Provider<AttendanceDetailsRepository>((ref) {
  return AttendanceDetailsRepository(
    client: ref.watch(supabaseClientProvider),
  );
});

final attendanceDetailsProvider = StateNotifierProvider.autoDispose
    .family<AttendanceDetailsController, AsyncValue<AttendanceDetails>, int>(
        (ref, id) {
  final repo = ref.watch(attendanceDetailsRepositoryProvider);
  return AttendanceDetailsController(repository: repo, id: id);
});
