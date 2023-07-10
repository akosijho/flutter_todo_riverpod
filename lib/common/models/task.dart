import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required int id,
    required String title,
    required String description,
    @Default(false) bool isCompleted,
    required String startTime,
    required String endTime,
    required int remind,
    required String repeat,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}
