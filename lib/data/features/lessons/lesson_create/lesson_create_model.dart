import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_create_model.freezed.dart';
part 'lesson_create_model.g.dart';

@freezed
class LessonCreate with _$LessonCreate {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LessonCreate({
    required DateTime startsAt,
    required DateTime endsAt,
    required String teacherId,
    required String subject,
  }) = _LessonCreate;

  factory LessonCreate.fromJson(Map<String, dynamic> json) =>
      _$LessonCreateFromJson(json);

  List<LessonCreate> toList(dynamic data) => (data as List<dynamic>)
      .map((e) => LessonCreate.fromJson(e as Map<String, dynamic>))
      .toList();

  LessonCreate converter(dynamic data) =>
      LessonCreate.fromJson(data as Map<String, dynamic>);
}

@freezed
class TeacherLessonCreate with _$TeacherLessonCreate {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TeacherLessonCreate({
    required String id,
    required String name,
  }) = _TeacherLessonCreate;

  factory TeacherLessonCreate.fromJson(Map<String, dynamic> json) =>
      _$TeacherLessonCreateFromJson(json);

  static List<TeacherLessonCreate> toList(dynamic data) =>
      (data as List<dynamic>)
          .map((e) => TeacherLessonCreate.fromJson(e as Map<String, dynamic>))
          .toList();
}
