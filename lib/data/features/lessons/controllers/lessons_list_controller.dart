import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/data/models/lesson.dart';

class LessonListController extends StateNotifier<AsyncValue<List<Lesson>>> {
  LessonListController(LessonsRepository? repository)
      : super(const AsyncValue.loading()) {
    if (repository == null) {
      return;
    }
    _repository = repository;
    getLessons();
  }

  late final LessonsRepository _repository;

  Future<void> getLessons() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _repository.getLessons());
  }

  /// Add organization to the list after creating it
  void addLesson(Lesson organization) {
    state = state.whenData((value) => value..add(organization));
  }

  Future<void> deleteLesson(Lesson lesson) async {
    await _repository.deleteLesson(lesson);
    state = state.whenData((value) => value..remove(lesson));
  }
}
