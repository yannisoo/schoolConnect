import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lesson_details/lesson_details_controller.dart';
import 'package:school_app/data/features/lessons/lesson_details/lesson_details_model.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';

final lessonProvider = StateNotifierProvider.autoDispose
    .family<LessonDetailsController, AsyncValue<LessonDetails>, String>(
        (ref, id) {
  final repo = ref.watch(lessonsRepositoryProvider);
  return LessonDetailsController(repo, id);
});
