import 'package:school_app/data/models/teachers/teacher.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class TeachersRepository {
  const TeachersRepository({
    required this.client,
    required this.user,
  });

  final supabase.User user;
  final supabase.SupabaseClient client;

  static const String _tableTeachers = 'Teachers';

  Future<List<Teacher>> getTeachers() async => await client
      .from(_tableTeachers)
      .select<supabase.PostgrestList>()
      .withConverter(Teacher.toList);

  Future<Teacher> getTeacherById(
    int id,
  ) async =>
      await client
          .from(_tableTeachers)
          .select<supabase.PostgrestMap>()
          .eq('id', id)
          .maybeSingle()
          .withConverter(Teacher.converter);

  Future<void> createTeacher(
    Teacher teacher,
  ) async =>
      await client.from(_tableTeachers).insert(teacher.toJson());

  Future<Teacher> updateTeacher(
    Teacher teacher,
  ) async =>
      await client
          .from(_tableTeachers)
          .update(
            teacher.toJson(),
          )
          .withConverter(Teacher.converter);

  Future<void> deleteTeacher(
    Teacher teacher,
  ) async =>
      await client
          .from(_tableTeachers)
          .delete(returning: supabase.ReturningOption.minimal)
          .eq('id', teacher.id);
}
