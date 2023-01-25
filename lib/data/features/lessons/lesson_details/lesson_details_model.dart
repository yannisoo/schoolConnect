import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_details_model.freezed.dart';
part 'lesson_details_model.g.dart';

@freezed
class LessonDetails with _$LessonDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LessonDetails({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime startsAt,
    required DateTime endsAt,
    required TeacherLessonDetails teacher,
    required String subject,
  }) = _LessonDetails;

  factory LessonDetails.fromJson(Map<String, dynamic> json) =>
      _$LessonDetailsFromJson(json);

  static List<LessonDetails> toList(dynamic data) => (data as List<dynamic>)
      .map((e) => LessonDetails.fromJson(e as Map<String, dynamic>))
      .toList();

  static LessonDetails converter(dynamic data) =>
      LessonDetails.fromJson(data as Map<String, dynamic>);
}

@freezed
class TeacherLessonDetails with _$TeacherLessonDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TeacherLessonDetails({
    required String name,
  }) = _TeacherLessonDetails;

  factory TeacherLessonDetails.fromJson(Map<String, dynamic> json) =>
      _$TeacherLessonDetailsFromJson(json);
}
