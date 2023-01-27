import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lesson_create/lesson_create_controller.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';

final lessonCreateProvider = StateProvider.autoDispose<LessonCreateController>(
  (ref) {
    final repo = ref.watch(lessonsRepositoryProvider);
    return LessonCreateController(repo, ref);
  },
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
