// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      isCompleted: json['isCompleted'] as int,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      remind: json['remind'] as int,
      repeat: json['repeat'] as String,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'isCompleted': instance.isCompleted,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'remind': instance.remind,
      'repeat': instance.repeat,
    };
