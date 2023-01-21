import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/providers.dart';
import 'package:school_app/data/features/auth/auth_provider.dart';
import 'package:school_app/data/features/lessons/controllers/lesson_controller.dart';
import 'package:school_app/data/features/lessons/controllers/lesson_create_controller.dart';
import 'package:school_app/data/features/lessons/controllers/lessons_list_controller.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/data/models/lesson.dart';

final lessonsRepositoryProvider = Provider<LessonsRepository?>((ref) {
  final user = ref.watch(authRepositoryProvider.select((v) => v.currentUser));
  if (user == null) {
    return null;
  }
  return LessonsRepository(
    client: ref.watch(supabaseClientProvider),
    user: user,
  );
});

final lessonListProvider = StateNotifierProvider.autoDispose<
    LessonListController, AsyncValue<List<Lesson>>>((ref) {
  final repo = ref.watch(lessonsRepositoryProvider);
  return LessonListController(repo);
});

final lessonProvider = StateNotifierProvider.autoDispose
    .family<LessonController, AsyncValue<Lesson>, String>((ref, id) {
  final repo = ref.watch(lessonsRepositoryProvider);
  return LessonController(repo, id);
});

final lessonCreateProvider = StateProvider.autoDispose<LessonCreateController>(
  LessonCreateController.new,
);

final subjectProvider = StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

final dateTimeProvider =
    StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

final startTimeProvider = StateProvider.autoDispose<TimeOfDay>(
  (ref) => const TimeOfDay(hour: 8, minute: 0),
);

final endTimeProvider = StateProvider.autoDispose<TimeOfDay>(
  (ref) => const TimeOfDay(hour: 9, minute: 0),
);
