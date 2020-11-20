import 'package:flutter/material.dart';

class MyState extends ChangeNotifier {
  List<TodoItem> _listTodo = [];
  //filterType börjar som "alla" 0=Inteklar, 1=Klar, 2=Alla.
  int filterType = 2;
  List<TodoItem> get listTodo => _listTodo;

  void addItem(TodoItem todo) {
    _listTodo.add(todo);
    notifyListeners();
  }
  void removeTodo(TodoItem todo) {
  _listTodo.remove(todo);
  notifyListeners();
}
void toggleTodo(TodoItem todo) {
  //Byter status på todoItem.
  if(todo.todoStatus > 0)
  	{
  		todo.todoStatus = 0;
  	} else 
  	{
    	todo.todoStatus = 1;
  	} 
  notifyListeners();
}
//Byter filter regel, alltså PopUpMenuButton använder denna.
void filterTodo(int filter) {
filterType = filter;
notifyListeners();
}
}

//Detta är vad en TodoItem innehåller.
class TodoItem {
  String message;
  //todoStatus börjar som inte klar 1=Inteklar, 0=Klar.
  int todoStatus = 1;

  TodoItem({this.message, this.todoStatus});
}