import 'package:flutter/material.dart';
import 'WebApi.dart';

class MyState extends ChangeNotifier {
  Future getList() async {
    List<TodoItem> listTodo = await WebApi.fetchTodos();
    _listTodo = listTodo;
    notifyListeners();
  }

  List<TodoItem> _listTodo = [];
  //filterType börjar som "alla" 0=Inteklar, 1=Klar, 2=Alla.
  int filterType = 2;
  List<TodoItem> get listTodo => _listTodo;

  void addTodo(TodoItem todo) async {
    await WebApi.addTodo(todo);
    await getList();
  }

  void removeTodo(TodoItem todo) async {
    await WebApi.deleteTodo(todo.id);
    await getList();
  }

  void toggleTodo(TodoItem todo) async {
    //Byter status på todoItem.
    if (todo.done > 0) {
      todo.done = 0;
     await WebApi.updateDone(todo);
     await getList();
    } else {
      todo.done = 1;
     await WebApi.updateDone(todo);
     await getList();
    }
    notifyListeners();
  }

//Byter filter regel, alltså PopUpMenuButton använder denna.
  void filterTodo(int filter) {
    filterType = filter;
    notifyListeners();
  }

}

class TodoItem {

  String id;
  String title;
  int done;

  TodoItem({this.id, this.title, this.done = 1});

  static Map<String, dynamic> toJson(TodoItem todo) {
    return {
      'title': todo.title,
      'done': todo.done,
    };
  }

  static TodoItem fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['id'],
      title: json['title'],
      done: json['done'],
    );
  }
}
