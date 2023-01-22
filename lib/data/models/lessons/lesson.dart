// ignore_for_file: type_annotate_public_apis, prefer_constructors_over_static_methods, inference_failure_on_untyped_parameter

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_app/data/models/teachers/teacher.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
class Lesson with _$Lesson {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Lesson({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
    @JsonKey(includeIfNull: false) DateTime? startsAt,
    @JsonKey(includeIfNull: false) DateTime? endsAt,
    @JsonKey(includeIfNull: false) Teacher? teacher,
    @Default('') String subject,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  static List<Lesson> toList(data) => (data as List<dynamic>)
      .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
      .toList();

  static Lesson converter(data) =>
      Lesson.fromJson(data as Map<String, dynamic>);
}
