import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/auth/auth_provider.dart';
import 'package:school_app/data/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

final sharedPreferencesProvider = FutureProvider(
  (ref) async => CustomLocalStorage(await SharedPreferences.getInstance()),
);

final supabaseProvider = FutureProvider<supabase.Supabase>(
  (ref) async => supabase.Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
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
