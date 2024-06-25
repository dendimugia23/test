import 'package:flutter/cupertino.dart';
import 'package:flutter_sqflite_provider/SQLite/database_helper.dart';
import '../Json/todo.dart';

class ProviderDB extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Todo> _todo = [];
  List<Todo> get todo => _todo;

  // Fetch Todo
  Future<void> fetchTodo() async {
    await _databaseHelper.initDB();
    _todo = await _databaseHelper.getTodo();
    notifyListeners();
  }

  // Insert Todo
  Future<void> insertTodo(Todo todos) async {
    await _databaseHelper.initDB();
    _databaseHelper.addTodo(todos);
    await fetchTodo();
  }

  // Update Todo
  Future<void> updateTodo(Todo todos) async {
    await _databaseHelper.initDB();
    _databaseHelper.updateTodo(todos);
    await fetchTodo();
  }

  // Delete Todo
  Future<void> deleteTodo(int id) async {
    await _databaseHelper.initDB();
    _databaseHelper.deleteTodo(id);
    await fetchTodo();
  }

  // Init
  void init() {
    fetchTodo();
    notifyListeners();
  }
}
