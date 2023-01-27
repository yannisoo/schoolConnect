import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lesson_details/lesson_details_provider.dart';

class LessonDetailsPage extends ConsumerWidget {
  const LessonDetailsPage({@PathParam('id') required this.lessonId, super.key});
  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesson = ref.watch(lessonProvider(lessonId));
    return Scaffold(
      appBar: AppBar(
        title: lesson.when(
          data: (o) => Text(o.module.subject),
          error: (e, s) => const Text('Error'),
          loading: CircularProgressIndicator.new,
        ),
      ),
      body: lesson.when(
        data: (o) => Text('${o.startsAt.toIso8601String()} - ${o.endsAt}'),
        error: (e, s) => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
