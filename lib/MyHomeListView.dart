import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyNextScreen.dart';
import 'MyList.dart';
import 'mystate.dart';

class MyHomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Consumer får att få state i både "appbar:" och "body:"
    return Consumer<MyState>(
      builder: (context, state, _) {
        return Scaffold(
          appBar: _appBar(context),
          //Hämtar MyList och filterregel, alltså Klar/Inte klar/Alla.
          body: MyList(state.listTodo, state.filterType),
          floatingActionButton: _navigateScreen(context),
        );
      },
    );
  }

  Widget _appBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: AppBar(
        backgroundColor: Colors.yellow,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box, color: Colors.black),
                    Text('Klar'),
                  ],
                ),
                value: 1,
              ),
              PopupMenuDivider(
                height: 10,
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box_outline_blank, color: Colors.black),
                    Text('Inte klar'),
                  ],
                ),
                value: 0,
              ),
              PopupMenuDivider(
                height: 10,
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.fact_check, color: Colors.black),
                    Text('Alla'),
                  ],
                ),
                value: 2,
              ),
            ],
            //Den PopUpMenueItem man klickar på returnar value "0, 1, eller 2." som då blir (filterType).
            onSelected: (filterType) {
              Provider.of<MyState>(context, listen: false)
                  .filterTodo(filterType);
            },
            icon: Icon(Icons.more_vert_outlined),
            color: Colors.white,
          ),
        ],
        title: Text("To-do List"),
      ),
    );
  }

  Widget _navigateScreen(context) {
    return FloatingActionButton(
      backgroundColor: Colors.yellow,
      child: Icon(Icons.add),
      onPressed: () async {
        var getTodo = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MyNextScreen(TodoItem(title: 'message'))));
        if (getTodo != null) {
          Provider.of<MyState>(context, listen: false).addTodo(getTodo);
        }
      },
    );
  }
}
