import 'package:school_app/data/models/lesson.dart';
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
        'id, subject, room, start_at, finish_at',
      )
      .withConverter(Lesson.toList);

  Future<Lesson> getLessonById(
    String id,
  ) async =>
      await client
          .from(_tableLessons)
          .select<supabase.PostgrestMap>()
          .eq('id', id)
          .maybeSingle()
          .withConverter(Lesson.converter);

  Future<void> createLesson(
    Lesson lesson,
  ) async =>
      await client.from(_tableLessons).insert(lesson.toJson());

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
