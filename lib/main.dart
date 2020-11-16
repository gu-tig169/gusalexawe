import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//popupmenubutton
// Importing our Task class
/*void main() => runApp(MyApp());*/
void main() {
  
  //Kör 'true' för debug emulator (se linjer och avstånd, kräver omstart av app).
  bool debugMode = false;
  debugPaintSizeEnabled = debugMode;
  runApp(MyApp());
}

//MaterialApp.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeList(),
    );
  } //Build end
} //End

//Skärm:1 - Lista med Todo.
class MyHomeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeListState();
  } //State end
} //End

class MyHomeListState extends State<MyHomeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _navigateScreen(context),
      body: _list(),
    );
  } //Build end
} //End

//Skärm:2 - Skapa ToDo.
class MyNextScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyNextScreenState();
  } //State end
} //End

class MyNextScreenState extends State<MyNextScreen> {
  @override
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
  } //Build end
} //End

Widget _appBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(38.0),
    child: AppBar(
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            var filterList = List<PopupMenuEntry<Object>>();
            filterList.add(
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box, color: Colors.black),
                    Text('Klar'),
                  ],
                ),
                value: 1,
              ),
            );
            filterList.add(
              PopupMenuDivider(
                height: 10,
              ),
            );
            filterList.add(
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.check_box_outline_blank, color: Colors.black),
                    Text('Inte klar'),
                  ],
                ),
                value: 2,
              ),
            );
            filterList.add(
              PopupMenuDivider(
                height: 10,
              ),
            );
            filterList.add(
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.fact_check, color: Colors.black),
                    Text('Alla'),
                  ],
                ),
                value: 3,
              ),
            );
            return filterList;
          },
          icon: Icon(Icons.more_vert_outlined),
          color: Colors.white,
        ),
      ],
      title: Text("To-do List"),
    ),
  );
} //End

Widget _appBar2() {
  return PreferredSize(
    preferredSize: Size.fromHeight(38.0),
    child: AppBar(
      title: Text("Lägg till To-Do"),
    ),
  );
} //End

//Navigatorknapp för ny sida.
Widget _navigateScreen(context) {
  return FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyNextScreen()));
    },
  );
} //End

//Textfält för ny To-Do.
Widget _createTodo() {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 0),
    child: TextField(
      autofocus: true,
      decoration: InputDecoration(hintText: "Jag behöver göra.."),
    ),
  );
} //End

//Spara ny To-Do.
Widget _acceptTodo() {
  return Container(
    margin: EdgeInsets.only(left: 120, right: 120, bottom: 50),
    child: Row(
      children: [
        Text(
          "Lägg till",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 35,
          onPressed: () {},
        ),
      ], //Children
    ),
  );
} //End

//Lista
Widget _list() {
  var names = [
    "tjena",
    "Laaa",
    "Gaaaas",
    "tjena",
    "Laaa",
    "Gaaaas",
    "tjena",
    "Laaa",
    "Gaaaas",
    "tjena",
    "Laaa",
    "Gaaaas",
  ];
  var list = List.generate(names.length, (index) => names[index % 3]);

  return ListView.builder(
    itemBuilder: (context, index) => _todoItem(list[index]),
    itemCount: names.length,
  );

//Bygg en lista här någonstans...
} //End

Widget _todoItem(text) {
  bool chekBox = false;
  return ListTile(
    leading: Checkbox(value: chekBox, onChanged: (bool newValue) {
     

    }),
    title: Text(text),
    trailing: IconButton(icon: Icon(Icons.delete),onPressed: () {},
    hoverColor: Colors.purple,),
    
  );
    /*Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 36),
          ),
        ),*/
} //End
