import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'mystate.dart';
import 'TodoItem.dart';

class MyList extends StatelessWidget {
  final List<TodoItem> list;
  final String filterBy;

  MyList(this.list, this.filterBy);

  Widget build(BuildContext context) {
    return ListView(
        children: _filterList(list, filterBy)
            .map((todo) => _todoItem(context, todo))
            .toList());
  }

  List<TodoItem> _filterList(listTodo, filterBy) {
    if (filterBy == 'Klar') {
      return listTodo.where((todo) => todo.done == true).toList();
    } else if (filterBy == 'Inte klar') {
      return listTodo.where((todo) => todo.done == false).toList();
    } else if (filterBy == 'Alla') {
      return listTodo;
    } else {
      print('Något gick fel');
      return null;
    }
  }

  Widget _todoItem(context, todo) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        elevation: 3.0,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          leading: Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.black,
              value: todo.done,
              onChanged: (bool newValue) {
                var state = Provider.of<MyState>(context, listen: false);
                state.toggleTodo(todo);
              }),
          title: Text(
            todo.title,
            style: TextStyle(
              color: Colors.black,
              decoration: todo.done == true ? TextDecoration.lineThrough : null,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          trailing: IconButton(
            color: Colors.black,
            icon: Icon(Icons.delete),
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeTodo(todo);
            },
          ),
        ));
  }
}
