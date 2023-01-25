import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_controller.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_model.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';

final lessonListProvider = StateNotifierProvider.autoDispose<
    LessonListController, AsyncValue<List<LessonList>>>((ref) {
  final repo = ref.watch(lessonsRepositoryProvider);
  final pageStart = ref.watch(lessonsPageStart);
  final pageEnd = ref.watch(lessonsPageEnd);
  return LessonListController(
    repository: repo,
    from: pageStart,
    to: pageEnd,
  );
});
final lessonsPageStart = StateProvider<int>((ref) => 0);

final lessonsPageEnd = StateProvider<int>((ref) => 5);

final lessonsCount = StateProvider<int?>((ref) => null);
