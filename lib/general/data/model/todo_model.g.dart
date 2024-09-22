// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      task: json['task'] as String,
      description: json['description'] as String,
      isDone: json['isDone'] as bool,
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'task': instance.task,
      'description': instance.description,
      'isDone': instance.isDone,
      'priority': instance.priority,
    };
