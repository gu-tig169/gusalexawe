class TodoItem {
  String id;
  String title;
  bool done;

  TodoItem({this.id, this.title, this.done = false});

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
