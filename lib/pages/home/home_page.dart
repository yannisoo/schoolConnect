import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/router/app_router.dart';

import 'package:school_app/data/features/lessons/lessons_provider.dart';
import 'package:school_app/utils/date_formatter.dart';
import 'package:school_app/utils/modals.dart';

class HomePage extends ConsumerWidget with DateFormatter {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonListProvider);
    final lessonController = ref.watch(lessonListProvider.notifier);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            AutoRouter.of(context).push(const LessonCreatePageRoute()),
        child: const Icon(Icons.add),
      ),
      body: lessons.when(
        data: (list) => RefreshIndicator(
          onRefresh: lessonController.getLessons,
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () => AutoRouter.of(context).push(
                LessonDetailsPageRoute(lessonId: list[index].id ?? ''),
              ),
              leading: const Icon(Icons.book),
              title: Text(list[index].subject),
              subtitle: Text(
                format(list[index].updatedAt),
              ),
              trailing: InkWell(
                onTap: () => confirmModal(
                  context,
                  message: 'Are you sure you want to delete this lesson?',
                  onConfirm: () => lessonController.deleteLesson(list[index]),
                ),
                child: const Icon(Icons.delete),
              ),
            ),
            itemCount: list.length,
          ),
        ),
        error: (e, s) => const SizedBox(),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
