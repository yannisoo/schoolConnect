// ignore_for_file:  prefer_constructors_over_static_methods, inference_failure_on_untyped_parameter

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_list_model.freezed.dart';
part 'lesson_list_model.g.dart';

@freezed
class LessonList with _$LessonList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LessonList({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime startsAt,
    required DateTime endsAt,
    @Default('') String subject,
  }) = _LessonList;

  factory LessonList.fromJson(Map<String, dynamic> json) =>
      _$LessonListFromJson(json);

  static List<LessonList> toList(dynamic data) => (data as List<dynamic>)
      .map((e) => LessonList.fromJson(e as Map<String, dynamic>))
      .toList();

  static LessonList converter(dynamic data) =>
      LessonList.fromJson(data as Map<String, dynamic>);
}
