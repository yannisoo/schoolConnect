import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/providers.dart';
import 'package:school_app/data/features/auth/auth_provider.dart';
import 'package:school_app/data/features/teachers/teachers_repository.dart';

final teachersRepositoryProvider = Provider<TeachersRepository?>((ref) {
  final user = ref.watch(authRepositoryProvider.select((v) => v.currentUser));
  if (user == null) {
    return null;
  }
  return TeachersRepository(
    client: ref.watch(supabaseClientProvider),
    user: user,
  );
});
