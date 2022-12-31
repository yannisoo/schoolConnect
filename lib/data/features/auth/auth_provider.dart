import 'package:familly/config/providers.dart';
import 'package:familly/data/features/auth/auth_controller.dart';
import 'package:familly/data/features/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authClient = ref.watch(supabaseClientProvider).auth;
  final prefs = ref.read(sharedPreferencesProvider).asData!.value;
  return AuthRepository(
    authClient: authClient,
    storage: prefs,
  );
});

final authStateListenable = ValueNotifier<bool>(false);

///
final authControllerProvider =
    StateNotifierProvider<AuthController, supabase.User?>(
  AuthController.new,
);

final emailProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
final passwordProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());
