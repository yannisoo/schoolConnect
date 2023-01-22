// ignore_for_file: type_annotate_public_apis, prefer_constructors_over_static_methods, inference_failure_on_untyped_parameter

import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
class Teacher with _$Teacher {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Teacher({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
    @Default('') String name,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  static List<Teacher> toList(data) => (data as List<dynamic>)
      .map((e) => Teacher.fromJson(e as Map<String, dynamic>))
      .toList();

  static Teacher converter(data) =>
      Teacher.fromJson(data as Map<String, dynamic>);
}
