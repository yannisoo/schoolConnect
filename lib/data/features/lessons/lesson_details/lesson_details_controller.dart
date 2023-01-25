import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lesson_details/lesson_details_model.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';

class LessonDetailsController extends StateNotifier<AsyncValue<LessonDetails>> {
  LessonDetailsController(this.repository, this.id)
      : super(const AsyncValue.loading()) {
    _getLesson(id);
  }

  final LessonsRepository repository;
  final String id;

  Future<void> _getLesson(String id) async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await repository.getLessonById(id));
  }
}
