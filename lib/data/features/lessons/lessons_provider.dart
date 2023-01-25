import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/providers.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';

final lessonsRepositoryProvider = Provider<LessonsRepository>((ref) {
  return LessonsRepository(
    client: ref.watch(supabaseClientProvider),
  );
});
