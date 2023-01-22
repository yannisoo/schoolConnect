import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/data/models/lessons/lesson.dart';

class LessonController extends StateNotifier<AsyncValue<Lesson>> {
  LessonController(LessonsRepository? repository, this.id)
      : super(const AsyncValue.loading()) {
    if (repository == null) {
      return;
    }
    _repository = repository;
    _getLesson(id);
  }

  late final LessonsRepository _repository;
  final String id;

  Future<void> _getLesson(String id) async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _repository.getLessonById(id));
  }
}
