import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sisterslabsecond/general/utils/app_utils.dart';

import '../../general/data/model/todo_model.dart';

class AddTaskPageController extends ChangeNotifier {
  final CollectionReference _todosCollection =
      FirebaseFirestore.instance.collection('todos');
  List<TodoModel> todos = [];

  bool? isDone = false;
  int? priority = PriorityEnum.LOW.index;

  Future<void> addTodo(TodoModel model) async {
    try {
      await _todosCollection.add({
        'todo': model.task,
        'is_done': model.isDone,
        'description': model.description,
        'created_at': FieldValue.serverTimestamp(),
        'priority': model.priority,
      });
    } catch (e) {
      print('ToDo eklenirken hata oluştu: $e');
    }
  }


  void isDoneChanged(bool? value) {
    isDone = value;
    notifyListeners();
  }

  void priorityChanged(int? value) {
    priority = value;
    notifyListeners();
  }

}
