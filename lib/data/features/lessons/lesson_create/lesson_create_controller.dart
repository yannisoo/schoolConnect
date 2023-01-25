import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lesson_create/lesson_create_model.dart';
import 'package:school_app/data/features/lessons/lesson_create/lesson_create_provider.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/utils/modals.dart';

class LessonCreateController {
  const LessonCreateController(this.repository, this._ref);
  final Ref _ref;
  final LessonsRepository repository;

  Future<void> createLesson() async {
    final dateProvider = _ref.read(dateTimeProvider);
    final teacherProvider = _ref.read(currentTeacherProvider);
    final subjectController = _ref.read(subjectProvider);
    final startTime = _ref.read(startTimeProvider);
    final endTime = _ref.read(endTimeProvider);

    final newLesson = LessonCreate(
      subject: subjectController.text,
      startsAt: DateTime(
        dateProvider.year,
        dateProvider.month,
        dateProvider.day,
        startTime.hour,
        startTime.minute,
      ),
      endsAt: DateTime(
        dateProvider.year,
        dateProvider.month,
        dateProvider.day,
        endTime.hour,
        endTime.minute,
      ),
      teacherId: teacherProvider.id,
    );
    await repository.createLesson(newLesson);
  }

  Future<void> selectStartTime(BuildContext context) async {
    final time = await selectTime(
      context,
      _ref.read(startTimeProvider),
    );
    if (time != null) {
      _ref.read(startTimeProvider.notifier).state = time;
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    final time = await selectTime(
      context,
      _ref.read(endTimeProvider),
    );
    if (time != null) {
      _ref.read(endTimeProvider.notifier).state = time;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final date = await selectDay(
      context,
      initialDate: _ref.read(dateTimeProvider),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      _ref.read(dateTimeProvider.notifier).state = date;
    }
  }
}
