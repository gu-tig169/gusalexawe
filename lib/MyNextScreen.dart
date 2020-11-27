import 'package:flutter/material.dart';
import 'mystate.dart';



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
  int done;

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
            /* RaisedButton.icon(
                onPressed: () {
                  _doStuff();
                },
                icon: Icon(Icons.access_alarms_rounded),
                label: Text('Lol'))*/
          ],
        ),
      ),
    );
  }

 /* void _doStuff() async {
    var result = await FetchStuffFromInternet.fetchStuffFromInternet();
    print(result);
  }*/

 /* Future<String> _fetchStuffFromInternet() async {
    http.Response response =
        await http.get('https://todoapp-api-vldfm.ondigitalocean.app/register');
    return response.body;
  }*/


  Widget _appBar2() {
    return PreferredSize(
      preferredSize: Size.fromHeight(38.0),
      child: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Lägg till To-Do"),
      ),
    );
  }

  Widget _createTodo() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 0),
      child: TextField(
        controller: textEditingController,
        //Får Texten och en ny status, alltså status 1=Inte klar.
        onSubmitted: (val) {
          Navigator.pop(context, TodoItem(title: title, done: 1));
        },
        autofocus: true,
        decoration: InputDecoration(hintText: "Jag behöver göra.."),
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
            onPressed: () {
              //Får Texten och en ny status, alltså status 1=Inte klar.
              Navigator.pop(context, TodoItem(title: title, done: 1));
              //addTodo(title);
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
