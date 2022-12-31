import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/router/app_router.dart';
import 'package:school_app/data/features/auth/auth_provider.dart';
import 'package:school_app/data/features/auth/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:uni_links/uni_links.dart';

class AuthController extends StateNotifier<supabase.User?> {
  AuthController(this._read) : super(null) {
    _initialize();
  }
  final Ref _read;
  AuthRepository get _repository => _read.read(authRepositoryProvider);
  TextEditingController get _emailController => _read.read(emailProvider);
  TextEditingController get _passwordController => _read.read(passwordProvider);

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

  Future<void> signOut() async {
    await _repository.signOut();
  }

  Future<void> signInWithGoogle() async {
    await _repository.signInWithGoogle();
  }

  Future<void> signIn(BuildContext context) async {
    await _repository.signIn(_emailController.text, _passwordController.text);
    await AutoRouter.of(context).replaceAll([const HomePageRoute()]);
  }

  Future<void> signUp(BuildContext context) async {
    await _repository.signUp(_emailController.text, _passwordController.text);
    await AutoRouter.of(context).replaceAll([const LoginPageRoute()]);
  }
}
