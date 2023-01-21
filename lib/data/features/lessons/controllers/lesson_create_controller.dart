import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/data/models/lesson.dart';
import 'package:school_app/utils/modals.dart';
import 'package:uuid/uuid.dart';

class LessonCreateController {
  LessonCreateController(this._read);
  final Ref _read;
  LessonsRepository? get _repository => _read.read(lessonsRepositoryProvider);

  TextEditingController get _subjectProvider => _read.read(subjectProvider);

  TimeOfDay get _timeStartProvider => _read.read(startTimeProvider);

  set _timeStartProvider(TimeOfDay value) =>
      _read.read(startTimeProvider.notifier).state = value;

  TimeOfDay get _timeEndProvider => _read.read(endTimeProvider);

  set _timeEndProvider(TimeOfDay value) =>
      _read.read(endTimeProvider.notifier).state = value;

  DateTime get _dateProvider => _read.read(dateTimeProvider);

  set _dateProvider(DateTime value) =>
      _read.read(dateTimeProvider.notifier).state = value;

  Future<void> createLesson() async {
    final newLesson = Lesson(
      id: const Uuid().v4(),
      subject: _subjectProvider.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      startAt: DateTime(
        _dateProvider.year,
        _dateProvider.month,
        _dateProvider.day,
        _timeStartProvider.hour,
        _timeStartProvider.minute,
      ),
      finishAt: DateTime(
        _dateProvider.year,
        _dateProvider.month,
        _dateProvider.day,
        _timeEndProvider.hour,
        _timeEndProvider.minute,
      ),
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
