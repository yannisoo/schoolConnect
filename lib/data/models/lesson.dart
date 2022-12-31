import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
class Lesson with _$Lesson {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Lesson({
    @JsonKey(includeIfNull: false) String? id,
    @Default('') String name,
    @JsonKey(includeIfNull: false) String? description,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
    @JsonKey(includeIfNull: false) DateTime? startAt,
    @JsonKey(includeIfNull: false) DateTime? finishAt,
    @JsonKey(includeIfNull: false) String? teacher,
    @Default('') String subject,
    @JsonKey(includeIfNull: false) String? room,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  static List<Lesson> toList(data) => (data as List<dynamic>)
      .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
      .toList();

  static Lesson converter(data) =>
      Lesson.fromJson(data as Map<String, dynamic>);
}
