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

  Future<List<Lesson>> getLessons() async =>
      await client.from(_tableLessons).select().withConverter(Lesson.toList);

  Future<Lesson> getLessonById(
    String id,
  ) async =>
      await client
          .from(_tableLessons)
          .select()
          .eq('id', id)
          .withConverter(Lesson.converter);

  Future<Lesson> createLesson(
    Lesson lesson,
  ) async =>
      await client
          .from(_tableLessons)
          .insert(
            lesson.toJson(),
          )
          .withConverter(Lesson.converter);

  Future<Lesson> updateOrganization(
    Lesson lesson,
  ) async =>
      await client
          .from(_tableLessons)
          .update(
            lesson.toJson(),
          )
          .withConverter(Lesson.converter);

  Future<bool> deleteOrganization(
    Lesson lesson,
  ) async =>
      await client.from(_tableLessons).delete().eq('id', lesson.id);
}
