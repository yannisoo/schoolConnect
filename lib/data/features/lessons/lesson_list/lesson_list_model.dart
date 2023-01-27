import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_list_model.freezed.dart';
part 'lesson_list_model.g.dart';

@freezed
class LessonList with _$LessonList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LessonList({
    required String id,
    required DateTime startsAt,
    required DateTime endsAt,
    required ModuleLessonList module,
  }) = _LessonList;

  factory LessonList.fromJson(Map<String, dynamic> json) =>
      _$LessonListFromJson(json);

  static List<LessonList> toList(dynamic data) => (data as List<dynamic>)
      .map((e) => LessonList.fromJson(e as Map<String, dynamic>))
      .toList();

  static LessonList converter(dynamic data) =>
      LessonList.fromJson(data as Map<String, dynamic>);
}

@freezed
class ModuleLessonList with _$ModuleLessonList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ModuleLessonList({
    required String id,
    required String subject,
  }) = _ModuleLessonList;

  factory ModuleLessonList.fromJson(Map<String, dynamic> json) =>
      _$ModuleLessonListFromJson(json);
}
