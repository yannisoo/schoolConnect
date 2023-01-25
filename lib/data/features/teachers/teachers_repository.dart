import 'package:school_app/data/features/lessons/lesson_create/lesson_create_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class TeachersRepository {
  const TeachersRepository({
    required this.client,
    required this.user,
  });

  final supabase.User user;
  final supabase.SupabaseClient client;

  static const String _tableTeachers = 'Teachers';

  Future<List<TeacherLessonCreate>> getTeachers() async => await client
      .from(_tableTeachers)
      .select<supabase.PostgrestList>()
      .withConverter(TeacherLessonCreate.toList);
}
