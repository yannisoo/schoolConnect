import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';
import 'package:school_app/data/features/teachers/teachers_repository.dart';
import 'package:school_app/data/models/teachers/teacher.dart';

class TeacherListController extends StateNotifier<AsyncValue<List<Teacher>>> {
  TeacherListController(TeachersRepository? repository, this._ref)
      : super(const AsyncValue.loading()) {
    if (repository == null) {
      return;
    }
    _repository = repository;
    getTeachers();
  }
  final Ref _ref;
  late final TeachersRepository _repository;

  Future<void> getTeachers() async {
    state = const AsyncValue.loading();
    final list = await _repository.getTeachers();
    state = AsyncValue.data(list);
    _ref.read(currentTeacherProvider.notifier).state = list.first;
  }

  void addTeacher(Teacher organization) {
    state = state.whenData((value) => value..add(organization));
  }

  Future<void> deleteTeacher(Teacher teacher) async {
    await _repository.deleteTeacher(teacher);
    state = state.whenData((value) => value..remove(teacher));
  }
}
