import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

// import 'package:date'
class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class Todo {
  String title;
  bool isDone = false;
  String dateTime = formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ' ', am]);

  Todo(this.title); // 생성자 생성
}

class _TodoListState extends State<TodoList> {
  final _items = <Todo>[];
  final _todoController = TextEditingController();

  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = "";
    });
  }

  void _deleteTodo(Todo todo) {
    if (!_items.contains(todo)) return;
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _todoController.dispose(); // 컨트롤러는 사용 후 dispose 해줘야함
    super.dispose();
  }

  Widget _buildTodoListItem(Todo todo) {
    return ListTile(
      title: Expanded(
        child: Row(
          children: [
            Text(todo.title,
                style: todo.isDone
                    ? const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontStyle: FontStyle.italic,
                )
                    : null),
            Text(todo.dateTime),
          ],
        ),
      ),
      trailing:
      IconButton(onPressed: () {
        _deleteTodo(todo);
      }, icon: const Icon(Icons.delete_forever)),
      onTap: () {
        _toggleTodo(todo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0, // appBar 그림자 농도
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addTodo(Todo(_todoController.text));
                  },
                  child: Text("추가"),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                // listview 위젯은 column 위젯의 child가 될때 expand으로 감싸줘야 정상적으로 작동함.
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children:
                _items.map((todo) => _buildTodoListItem(todo)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
