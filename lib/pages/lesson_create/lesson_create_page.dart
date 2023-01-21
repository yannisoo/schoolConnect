import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/router/app_router.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';
import 'package:school_app/utils/modals.dart';

class LessonCreatePage extends ConsumerWidget {
  const LessonCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Lesson'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextFormField(
            controller: ref.watch(subjectProvider),
            decoration: const InputDecoration(labelText: 'Subject'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await ref.read(lessonCreateProvider).createLesson();
                await AutoRouter.of(context).push(const HomePageRoute());
              } catch (e) {
                errorModal(
                  context,
                  message: 'Error creating lesson: ${e.toString()}',
                );
              }
            },
            child: const Text('Log in'),
          ),
        ],
      ),
    );
  }
}
