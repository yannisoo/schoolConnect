import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/data/features/lessons/lessons_provider.dart';
import 'package:school_app/data/features/lessons/lessons_repository.dart';
import 'package:school_app/data/models/lesson.dart';
import 'package:uuid/uuid.dart';

class LessonCreateController {
  LessonCreateController(this._read);
  final Ref _read;
  LessonsRepository? get _repository => _read.read(lessonsRepositoryProvider);

  TextEditingController get _subjectProvider => _read.read(subjectProvider);

  Future<void> createLesson() async {
    final newLesson = Lesson(
      id: const Uuid().v4(),
      subject: _subjectProvider.text,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _subjectProvider.clear();
    await _repository?.createLesson(newLesson);
  }
}
