import 'package:school_app/data/features/attendance/attendance_day/attendance_day_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AttendanceDayRepository {
  const AttendanceDayRepository({
    required this.client,
  });

  final supabase.SupabaseClient client;

  static const String _tableLessons = 'attendance';

  Future<List<AttendanceDay>> getAttendanceDay() async => await client
      .from(_tableLessons)
      .select<supabase.PostgrestList>(
        'is_present, lesson:lesson_id!inner(id, starts_at, ends_at, module:module_id!inner(id, subject)), validated_at',
      )
      .lt(
        'lesson.starts_at',
        DateTime.now().add(const Duration(days: 1)).toString(),
      )
      .gt(
        'lesson.starts_at',
        DateTime.now().toString(),
      )
      .withConverter(AttendanceDay.toList);
}
