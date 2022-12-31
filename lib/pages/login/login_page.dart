import 'package:familly/data/features/auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            ElevatedButton(
              onPressed: () {
                try {
                  ref.read(authControllerProvider.notifier).signInWithOtp();
                } catch (e) {
                  print(e);
                }
              },
              child: Text('test'),
            )
          ],
        ),
      );
}
