import 'dart:core';

import 'package:school_app/data/services/local_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthRepository {
  const AuthRepository({
    required this.authClient,
    required this.storage,
  });

  final supabase.GoTrueClient authClient;
  final CustomLocalStorage storage;

  /// Current authorized User
  supabase.User? get currentUser => authClient.currentUser == null
      ? null
      : supabase.User.fromJson(authClient.currentUser!.toJson());

  void authStateChange(
    void Function(supabase.User? user) callback,
  ) {
    authClient.onAuthStateChange.listen((event) {
      switch (event.event) {
        case supabase.AuthChangeEvent.signedIn:
          callback(authClient.currentUser);
          break;
        case supabase.AuthChangeEvent.signedOut:
          callback(null);
          break;
        case supabase.AuthChangeEvent.userUpdated:
          callback(authClient.currentUser);
          break;
        case supabase.AuthChangeEvent.passwordRecovery:
        case supabase.AuthChangeEvent.tokenRefreshed:
        case supabase.AuthChangeEvent.userDeleted:
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          break;
      }
    });
  }

  Future<supabase.User?> setSession(String token) async {
    final response = await authClient.setSession(token);
    await storage.store(
      LocalStorageKey.sessionToken,
      response.session?.persistSessionString ?? '',
    );

    final data = response.user;

    if (data == null) {
      await storage.remove(LocalStorageKey.sessionToken);
      return null;
    }
    return data;
  }

  /// Recovers session from local storage and refreshes tokens
  Future<supabase.User?> restoreSession() async {
    final res = storage.get(LocalStorageKey.sessionToken);
    if (res == null || res == '') {
      return null;
    }

    final response = await authClient.recoverSession(res);
    final data = response.user;

    if (data == null) {
      await storage.remove(LocalStorageKey.sessionToken);
    }

    await storage.store(
      LocalStorageKey.sessionToken,
      response.session?.persistSessionString ?? '',
    );

    return data;
  }

  Future<bool> signInWithGoogle() async => authClient.signInWithOAuth(
        supabase.Provider.google,
      );

  Future<void> signUp(String email, String password) async =>
      authClient.signUp(email: email, password: password);

  Future<supabase.AuthResponse> signIn(String email, String password) async =>
      authClient.signInWithPassword(email: email, password: password);

  Future<void> signOut() async {
    await storage.remove(LocalStorageKey.sessionToken);
    return authClient.signOut();
  }
}
