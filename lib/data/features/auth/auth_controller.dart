import 'package:familly/data/features/auth/auth_provider.dart';
import 'package:familly/data/features/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:uni_links/uni_links.dart';

class AuthController extends StateNotifier<supabase.User?> {
  ///
  AuthController(this._read) : super(null) {
    _initialize();
  }
  final Ref _read;
  AuthRepository get _repository => _read.read(authRepositoryProvider);
  TextEditingController get _phoneNumberController => _read.read(emailProvider);

  ///
  Future<void> _initialize() async {
    await _repository.restoreSession();
    _updateAuthState();
    if (state == null) {
      await _handleInitialDeepLink();
    }

    /// listen to auth changes
    _repository.authStateChange((user) {
      state = user;
      _updateAuthState();
    });
  }

  void _updateAuthState() {
    authStateListenable.value = state != null;
  }

  Future<void> _handleInitialDeepLink() async {
    final initialLink = await getInitialLink();
    if (!(initialLink?.contains('refresh_token=') ?? false)) {
      return;
    }

    final refreshTokenQueryParam = initialLink
        ?.split('&')
        .firstWhere((element) => element.contains('refresh_token'));

    final refreshToken = refreshTokenQueryParam
        ?.substring(refreshTokenQueryParam.indexOf('=') + 1);
    if (refreshToken == null) {
      return;
    }

    await _repository.setSession(refreshToken);
    _updateAuthState();
  }

  /// Signs out user
  Future<void> signOut() async {
    await _repository.signOut();
  }

  Future<void> signInWithGoogle() async {
    await _repository.signInWithGoogle();
  }

  Future<void> signInWithOtp() async {
    await _repository.signInWithOtp(_phoneNumberController.text);
  }
}
