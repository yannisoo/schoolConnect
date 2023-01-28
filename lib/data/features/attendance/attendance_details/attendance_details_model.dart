import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_details_model.freezed.dart';
part 'attendance_details_model.g.dart';

@freezed
class AttendanceDetails with _$AttendanceDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendanceDetails({
    required bool isPresent,
    required AttendanceDetailsLesson lesson,
    DateTime? validatedAt,
  }) = _AttendanceDetails;

  factory AttendanceDetails.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailsFromJson(json);

  static List<AttendanceDetails> toList(dynamic data) => (data as List<dynamic>)
      .map((e) => AttendanceDetails.fromJson(e as Map<String, dynamic>))
      .toList();

  static AttendanceDetails converter(dynamic data) =>
      AttendanceDetails.fromJson(data as Map<String, dynamic>);
}

@freezed
class AttendanceDetailsLesson with _$AttendanceDetailsLesson {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendanceDetailsLesson({
    required String id,
    required DateTime startsAt,
    required DateTime endsAt,
    required AttendanceDetailsModule module,
  }) = _AttendanceDetailsLesson;

  factory AttendanceDetailsLesson.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailsLessonFromJson(json);
}

@freezed
class AttendanceDetailsModule with _$AttendanceDetailsModule {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendanceDetailsModule({
    required String id,
    required String subject,
  }) = _AttendanceDetailsModule;

  factory AttendanceDetailsModule.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailsModuleFromJson(json);
}
