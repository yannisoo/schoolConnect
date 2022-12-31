import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/auth/auth_provider.dart';
import 'package:school_app/utils/error_manager.dart';

@immutable
class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
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
              onPressed: () {
                try {
                  ref.read(authControllerProvider.notifier).signUp(context);
                } catch (e) {
                  errorDisplayer(context, message: e.toString());
                }
              },
              child: const Text('Sign up'),
            )
          ],
        ),
      );
}
