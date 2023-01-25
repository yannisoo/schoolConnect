import 'package:school_app/data/features/lessons/lesson_create/lesson_create_model.dart';
import 'package:school_app/data/features/lessons/lesson_details/lesson_details_model.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_model.dart';
import 'package:school_app/data/models/pagination.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class LessonsRepository {
  const LessonsRepository({
    required this.client,
  });

  final supabase.SupabaseClient client;

  static const String _tableLessons = 'Lessons';

  Future<ListWithCount<List<LessonList>>> getLessonsWithCount({
    required int from,
    required int to,
  }) async {
    final response = await client
        .from(_tableLessons)
        .select<supabase.PostgrestResponse<List<Map<String, dynamic>>>>(
          'id, subject, starts_at, ends_at',
          const supabase.FetchOptions(count: supabase.CountOption.exact),
        )
        .range(from, to);
    return ListWithCount(
      count: response.count ?? 0,
      data: LessonList.toList(response.data),
    );
  }

  Future<List<LessonList>> getLessons({
    required int from,
    required int to,
  }) async =>
      await client
          .from(_tableLessons)
          .select<supabase.PostgrestList>(
            'id, subject, starts_at, ends_at',
          )
          .range(from, to)
          .withConverter(LessonList.toList);

  Future<LessonDetails> getLessonById(
    String id,
  ) async =>
      await client.from(_tableLessons).select<supabase.PostgrestMap>('''
    id,
    subject,
    teacher:teacher_id ( name, id )
  ''').eq('id', id).maybeSingle().withConverter(LessonDetails.converter);

  Future<void> createLesson(
    LessonCreate lesson,
  ) async {
    await client.from(_tableLessons).insert(lesson.toJson());
  }

  // Future<Lesson> updateLesson(
  //   Lesson lesson,
  // ) async =>
  //     await client
  //         .from(_tableLessons)
  //         .update(
  //           lesson.toJson(),
  //         )
  //         .withConverter(Lesson.converter);

  Future<void> deleteLesson(String id) async =>
      await client.from(_tableLessons).delete().eq('id', id);
}
