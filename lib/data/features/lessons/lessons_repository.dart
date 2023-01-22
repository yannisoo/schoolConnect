import 'package:school_app/data/models/lessons/lesson.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class LessonsRepository {
  const LessonsRepository({
    required this.client,
    required this.user,
  });

  final supabase.User user;
  final supabase.SupabaseClient client;

  static const String _tableLessons = 'Lessons';

  Future<List<Lesson>> getLessons() async => await client
      .from(_tableLessons)
      .select<supabase.PostgrestList>(
        'id, subject, starts_at, ends_at',
      )
      .withConverter(Lesson.toList);

  Future<Lesson> getLessonById(
    String id,
  ) async =>
      await client.from(_tableLessons).select<supabase.PostgrestMap>('''
    id,
    subject,
    teacher:teacher_id ( name, id )
  ''').eq('id', id).maybeSingle().withConverter(Lesson.converter);

  Future<void> createLesson(
    Lesson lesson,
  ) async {
    final map = lesson.toJson()
      ..remove('teacher')
      ..['teacher_id'] = lesson.teacher?.id;
    await client.from(_tableLessons).insert(map);
  }

  Future<Lesson> updateLesson(
    Lesson lesson,
  ) async =>
      await client
          .from(_tableLessons)
          .update(
            lesson.toJson(),
          )
          .withConverter(Lesson.converter);

  Future<void> deleteLesson(
    Lesson lesson,
  ) async =>
      await client
          .from(_tableLessons)
          .delete(returning: supabase.ReturningOption.minimal)
          .eq('id', lesson.id);
}
