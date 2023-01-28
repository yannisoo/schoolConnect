import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_day_model.freezed.dart';
part 'attendance_day_model.g.dart';

@freezed
class AttendanceDay with _$AttendanceDay {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendanceDay({
    required int id,
    required bool isPresent,
    required AttendanceDayLesson lesson,
    DateTime? validatedAt,
  }) = _AttendanceDay;

  factory AttendanceDay.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDayFromJson(json);

  static List<AttendanceDay> toList(dynamic data) => (data as List<dynamic>)
      .map((e) => AttendanceDay.fromJson(e as Map<String, dynamic>))
      .toList();

  static AttendanceDay converter(dynamic data) =>
      AttendanceDay.fromJson(data as Map<String, dynamic>);
}

@freezed
class AttendanceDayLesson with _$AttendanceDayLesson {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendanceDayLesson({
    required String id,
    required DateTime startsAt,
    required DateTime endsAt,
    required AttendanceDayModule module,
  }) = _AttendanceDayLesson;

  factory AttendanceDayLesson.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDayLessonFromJson(json);
}

@freezed
class AttendanceDayModule with _$AttendanceDayModule {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendanceDayModule({
    required String id,
    required String subject,
  }) = _AttendanceDayModule;

  factory AttendanceDayModule.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDayModuleFromJson(json);
}
