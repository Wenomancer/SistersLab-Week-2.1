import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../general/data/model/todo_model.dart';

class HomePageController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _auth.signOut();
  }

  final CollectionReference _todosCollection = FirebaseFirestore.instance.collection('todos');
  List<TodoModel> todos = [];

  void init() {
    fetchTodos();
    _todosCollection.snapshots().listen((event) {
      fetchTodos();
    });
  }

  Future<void> fetchTodos() async {
    Logger().wtf('xxxxxxxxxxfetchTodos');

    try {
      final snapshot = await _todosCollection.orderBy('created_at').get();
      todos = snapshot.docs.map((doc) => TodoModel.fromDocumentSnapshot(doc)).toList();
      notifyListeners();
    } catch (e) {
      print('Hata: $e');
    }
  }

  MaterialColor getColorFromPriority(int? priority) {
    switch (priority) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}