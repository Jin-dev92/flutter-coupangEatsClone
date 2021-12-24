import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:date'
class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class Todo {
  String title;
  bool isDone;
  String dateTime = formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ' ', am]);

  Todo(this.title, {this.isDone = false}); // 생성자 생성
// Todo(this.title ,@require xxx , ? 가변인자 취급); // 생성자 생성
}

class _TodoListState extends State<TodoList> {
  final _todoController = TextEditingController();
  final CollectionReference todoCollectionReference = FirebaseFirestore.instance.collection("todo");

  void _addTodo(Todo todo) {
    todoCollectionReference.add({
      'title': todo.title,
      'isDone': todo.isDone,
      'dateTime': todo.dateTime
    });
    _todoController.text = "";
  }

  void _deleteTodo(DocumentSnapshot doc) {
    // if (!_items.contains(doc)) return;
    // setState(() {
    //   _items.remove(doc);
    // });
    todoCollectionReference.doc(doc.id).delete();
  }

  void _toggleTodo(DocumentSnapshot doc) {
    todoCollectionReference.doc(doc.id).update({'isDone' : !doc['isDone']});
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

  Widget _buildTodoListItem(DocumentSnapshot doc) {
    final todo = Todo(doc['title'],isDone: doc['isDone']);
    return ListTile(
      title: Row(
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
      trailing: IconButton(
          onPressed: () {
            _deleteTodo(doc);
          },
          icon: const Icon(Icons.delete_forever)),
      onTap: () {
        _toggleTodo(doc);
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
            StreamBuilder<QuerySnapshot>(
              stream: todoCollectionReference.snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                final documents = snapshot.data!.docs;
                return Expanded(
                  child: ListView(
                    // listview 위젯은 column 위젯의 child가 될때 expand으로 감싸줘야 정상적으로 작동함.
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: documents.map((doc) => _buildTodoListItem(doc)).toList(),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
