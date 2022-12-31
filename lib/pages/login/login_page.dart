import 'package:auto_route/auto_route.dart';
import 'package:familly/config/router/app_router.dart';
import 'package:familly/config/themes.dart';
import 'package:familly/data/features/auth/auth_provider.dart';
import 'package:familly/utils/error_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

@immutable
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          children: [
            TextFormField(
              controller: ref.watch(emailProvider),
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: ref.watch(passwordProvider),
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref
                      .read(authControllerProvider.notifier)
                      .signIn(context);
                } on supabase.AuthException catch (e) {
                  errorDisplayer(context, message: e.message);
                } catch (_) {
                  errorDisplayer(context);
                }
              },
              child: const Text('Log in'),
            ),
            Center(
              child: InkWell(
                onTap: () =>
                    AutoRouter.of(context).push(const RegisterPageRoute()),
                child: Text(
                  "s'incrire",
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: theme.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
