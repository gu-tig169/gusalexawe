import 'package:flutter/material.dart';
import 'TodoItem.dart';
import 'WebApi.dart';

class MyState extends ChangeNotifier {
  String _filterBy = 'Alla';
  List<TodoItem> _listTodo = [];

  List<TodoItem> get listTodo => _listTodo;
  String get filterBy => _filterBy;

  Future getList() async {
    List<TodoItem> listTodo = await WebApi.fetchTodos();
    _listTodo = listTodo;
    notifyListeners();
  }

  void addTodo(TodoItem todo) async {
    await WebApi.addTodo(todo);
    await getList();
  }

  void removeTodo(TodoItem todo) async {
    await WebApi.deleteTodo(todo.id);
    await getList();
  }

  void toggleTodo(TodoItem todo) async {
    if (todo.done == true) {
      todo.done = false;
      await WebApi.updateDone(todo);
      await getList();
    } else if (todo.done == false) {
      todo.done = true;
      await WebApi.updateDone(todo);
      await getList();
    }
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
