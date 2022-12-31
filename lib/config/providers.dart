import 'package:familly/data/features/auth/auth_provider.dart';
import 'package:familly/data/services/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final sharedPreferencesProvider = FutureProvider(
  (ref) async => CustomLocalStorage(await SharedPreferences.getInstance()),
);

final supabaseProvider = FutureProvider<supabase.Supabase>(
  (ref) async => supabase.Supabase.initialize(
    url: 'https://ffvxfteqroddmgxdurho.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZmdnhmdGVxcm9kZG1neGR1cmhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzIyNTAzNzIsImV4cCI6MTk4NzgyNjM3Mn0.rZx6U5O0ndEfOG17Kj1xJXW87pIdV56mmWRJLpMenXQ',
  ),
);

final supabaseClientProvider = Provider<supabase.SupabaseClient>(
  (ref) => ref.read(supabaseProvider).asData!.value.client,
);

Future<void> initializeProviders(ProviderContainer container) async {
  await container.read(sharedPreferencesProvider.future);
  await container.read(supabaseProvider.future);

  container.read(authControllerProvider);
}
