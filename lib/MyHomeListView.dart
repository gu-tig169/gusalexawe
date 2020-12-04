import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyNextScreen.dart';
import 'MyList.dart';
import 'mystate.dart';
import 'TodoItem.dart';

class MyHomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: _appBar(context),
          body: MyList(state.listTodo, state.filterBy),
          floatingActionButton: _navigateScreen(context),
        );
      },
    );
  }

  Widget _appBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "ToDo List",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              Provider.of<MyState>(context, listen: false).setFilterBy(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Row(children: <Widget>[
                    Icon(Icons.check_box, color: Colors.black),
                    Text('Klar')
                  ]),
                  value: 'Klar'),
              PopupMenuDivider(height: 10),
              PopupMenuItem(
                  child: Row(children: <Widget>[
                    Icon(Icons.check_box_outline_blank, color: Colors.black),
                    Text('Inte klar')
                  ]),
                  value: 'Inte klar'),
              PopupMenuDivider(height: 10),
              PopupMenuItem(
                  child: Row(children: <Widget>[
                    Icon(Icons.fact_check, color: Colors.black),
                    Text('Alla')
                  ]),
                  value: 'Alla')
            ],
          ),
        ],
      ),
    );
  }

  Widget _navigateScreen(context) {
    return FloatingActionButton(
      backgroundColor: Colors.yellow,
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      onPressed: () async {
        var getTodo = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyNextScreen(TodoItem(title: 'todo'))));
        if (getTodo != null) {
          Provider.of<MyState>(context, listen: false).addTodo(getTodo);
        }
      },
    );
  }
}
