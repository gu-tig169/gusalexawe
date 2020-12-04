import 'package:flutter/material.dart';
import 'TodoItem.dart';

class MyNextScreen extends StatefulWidget {
  final TodoItem todo;

  MyNextScreen(this.todo);

  @override
  State<StatefulWidget> createState() {
    return MyNextScreenState(todo);
  }
}

class MyNextScreenState extends State<MyNextScreen> {
  String title;
  bool done;

  TextEditingController textEditingController;

  MyNextScreenState(TodoItem todo) {
    this.title = todo.title;

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar2(),
      body: Center(
        child: Column(
          children: [
            _createTodo(),
            Container(height: 10),
            _acceptTodo(),
          ],
        ),
      ),
    );
  }

  Widget _appBar2() {
    return PreferredSize(
      preferredSize: Size.fromHeight(38.0),
      child: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow,
        title: Text("Lägg till ToDo", style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _createTodo() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 0),
      child: TextField(
        controller: textEditingController,
        onSubmitted: (val) {
          Navigator.pop(context, TodoItem(title: title, done: false));
        },
        autofocus: true,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            )),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            hintText: "Jag behöver göra.."),
      ),
    );
  }

  Widget _acceptTodo() {
    return Container(
      margin: EdgeInsets.only(left: 120, right: 120, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton.icon(
            color: Colors.yellow,
            onPressed: () {
              Navigator.pop(context, TodoItem(title: title, done: false));
            },
            icon: Icon(Icons.add),
            label: Text(
              "Lägg till",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
