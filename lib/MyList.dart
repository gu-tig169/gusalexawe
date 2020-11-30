import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'mystate.dart';


class MyList extends StatelessWidget {
  //Deklarerar en Lista med TodoItem och en filterType som är en int.
  final List<TodoItem> list;
  final int filterType;

  //Konstruktorn, för att skapa MyList måste du skicka med en lista och en int.
  MyList(this.list, this.filterType);

//Bygger en ny lista, söker i "list" kollar done hos alla objekt i MyList och jämför done med filterType i MyList.
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .where((i) => i.done != filterType)
          .toList()
          .map((todo) => _todoItem(context, todo))
          .toList(),
    );
  }

  Widget _todoItem(context, todo) {
    return new ListTile(
      leading: Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.black,
          focusColor: Colors.black,
          //(todo.done == 0) = antingen true/false, alltså en bool.
          value: (todo.done == 0),
          onChanged: (bool newValue) {
            var state = Provider.of<MyState>(context, listen: false);
            state.toggleTodo(todo);
          }),
      title: Text(
        todo.title,
        style: TextStyle(
          //Beroende på om status är false/true, skapas en linje när todon är klar eller "checked".
          decoration: todo.done == 0 ? TextDecoration.lineThrough : null,
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
    );
  }
}