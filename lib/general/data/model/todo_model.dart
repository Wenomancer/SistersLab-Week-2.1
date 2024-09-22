import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  String? task;
  String? description;
  bool? isDone;
  int? priority;

  TodoModel({
    required this.task,
    required this.description,
    required this.isDone,
    required this.priority,
  });

  factory TodoModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return TodoModel(
      task: doc['todo'] ?? '',
      isDone: doc['is_done'] ?? false,
      description: doc['description'] ?? '',
      priority: doc['priority'] ?? 0,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
