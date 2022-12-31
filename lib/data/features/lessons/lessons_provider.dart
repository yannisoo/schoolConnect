import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/providers.dart';
import 'package:school_app/data/features/auth/auth_provider.dart';
import 'package:school_app/data/features/lessons/controllers/lessons_list_controller.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/data/models/lesson.dart';

final organizationRepositoryProvider = Provider<LessonsRepository?>((ref) {
  final user = ref.watch(authRepositoryProvider.select((v) => v.currentUser));
  if (user == null) {
    return null;
  }
  return LessonsRepository(
    client: ref.watch(supabaseClientProvider),
    user: user,
  );
});

final lessonListProvider =
    StateNotifierProvider<LessonListController, AsyncValue<List<Lesson>>>(
        (ref) {
  final repo = ref.watch(organizationRepositoryProvider);
  return LessonListController(repo);
});
