import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/data/models/lessons/lesson.dart';
import 'package:school_app/data/models/teachers/teacher.dart';
import 'package:school_app/utils/modals.dart';

class LessonCreateController {
  LessonCreateController(this._ref);
  final Ref _ref;
  LessonsRepository? get _repository => _ref.read(lessonsRepositoryProvider);

  TextEditingController get _subjectProvider => _ref.read(subjectProvider);

  TimeOfDay get _timeStartProvider => _ref.read(startTimeProvider);

  set _timeStartProvider(TimeOfDay value) =>
      _ref.read(startTimeProvider.notifier).state = value;

  TimeOfDay get _timeEndProvider => _ref.read(endTimeProvider);

  set _timeEndProvider(TimeOfDay value) =>
      _ref.read(endTimeProvider.notifier).state = value;

  DateTime get _dateProvider => _ref.read(dateTimeProvider);

  set _dateProvider(DateTime value) =>
      _ref.read(dateTimeProvider.notifier).state = value;

  Teacher get _teacherProvider => _ref.read(currentTeacherProvider);

  Future<void> createLesson() async {
    final newLesson = Lesson(
      subject: _subjectProvider.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      startsAt: DateTime(
        _dateProvider.year,
        _dateProvider.month,
        _dateProvider.day,
        _timeStartProvider.hour,
        _timeStartProvider.minute,
      ),
      endsAt: DateTime(
        _dateProvider.year,
        _dateProvider.month,
        _dateProvider.day,
        _timeEndProvider.hour,
        _timeEndProvider.minute,
      ),
      teacher: _teacherProvider,
    );
    await _repository?.createLesson(newLesson);
  }

  Future<void> selectStartTime(BuildContext context) async {
    final time = await selectTime(
      context,
      _timeStartProvider,
    );
    if (time != null) {
      _timeStartProvider = time;
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    final time = await selectTime(
      context,
      _timeEndProvider,
    );
    if (time != null) {
      _timeEndProvider = time;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final date = await selectDay(
      context,
      initialDate: _dateProvider,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      _dateProvider = date;
    }
  }
}
