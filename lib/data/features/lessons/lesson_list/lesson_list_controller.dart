import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lesson_list/lesson_list_model.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';

class LessonListController extends StateNotifier<AsyncValue<List<LessonList>>> {
  LessonListController({
    required this.repository,
    required this.from,
    required this.to,
  }) : super(const AsyncValue.loading()) {
    getLessons();
  }
  final int from;
  final int to;
  final LessonsRepository repository;

  Future<void> getLessons() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await repository.getLessons(from: from, to: to));
  }
}
