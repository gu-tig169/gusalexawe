import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mystate.dart';

const URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const KEY = '96372007-914d-4671-9dc2-db366b039a50';

class WebApi {
  static Future addTodo(TodoItem todo) async {
    print(todo);
    Map<String, dynamic> json = TodoItem.toJson(todo);
    var bodyString = jsonEncode(json);
    print(json);
    await http.post(
      '$URL/todos?key=$KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    print('done');
  }

  static Future updateDone(TodoItem todo) async {
    var json = jsonEncode(TodoItem.toJson(todo));
    String todoid = todo.id;
    await http.put(
      '$URL/todos/$todoid?key=$KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future deleteTodo(String todoId) async {
   http.Response response = await http.delete('$URL/todos/$todoId?key=$KEY');
   print(response.body);
   print('done');
  }

  static Future<List<TodoItem>> fetchTodos() async {
    var response = await http.get('$URL/todos?key=$KEY');
    var json = jsonDecode(response.body);
    print(json);
    return json.map<TodoItem>((data) {
      return TodoItem.fromJson(data);
    }).toList();
    
  }
}

/*class FetchStuffFromInternet {
static Future<String> fetchStuffFromInternet() async {
    http.Response response =
        await http.get('https://todoapp-api-vldfm.ondigitalocean.app/register');
    return response.body;
  }
}*/
