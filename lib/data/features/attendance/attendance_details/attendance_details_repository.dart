import 'package:school_app/data/features/attendance/attendance_details/attendance_details_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AttendanceDetailsRepository {
  const AttendanceDetailsRepository({
    required this.client,
  });

  final supabase.SupabaseClient client;

  static const String _tableLessons = 'attendance';

  Future<AttendanceDetails> getAttendanceDetails(int id) async => await client
      .from(_tableLessons)
      .select<supabase.PostgrestMap>(
        'id, is_present, lesson:lesson_id!inner(id, starts_at, ends_at, module:module_id!inner(id, subject)), validated_at',
      )
      .eq('id', id)
      .maybeSingle()
      .withConverter(AttendanceDetails.converter);
}
