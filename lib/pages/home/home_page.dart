import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonListProvider);
    return Scaffold(
      appBar: AppBar(
        title: lessons.when(
          data: (o) => const Text(
            'home',
          ),
          error: (e, s) => const Text('Error'),
          loading: CircularProgressIndicator.new,
        ),
      ),
      body: lessons.when(
        data: (list) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 48),
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(list[index].subject),
            ),
            itemCount: list.length,
          ),
        ),
        error: (e, s) => const CircularProgressIndicator(),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
