import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_create_model.freezed.dart';
part 'lesson_create_model.g.dart';

@freezed
class LessonCreate with _$LessonCreate {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LessonCreate({
    required DateTime startsAt,
    required DateTime endsAt,
    required String subject,
  }) = _LessonCreate;

  factory LessonCreate.fromJson(Map<String, dynamic> json) =>
      _$LessonCreateFromJson(json);
}
