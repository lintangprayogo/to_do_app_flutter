import 'package:flutter/material.dart';
import 'package:to_do_app/component/todo_item.dart';
import 'package:to_do_app/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = [
      Todo(id: '1', desc: 'Clean the room'),
      Todo(id: '2', desc: 'Wash the dish'),
      Todo(id: '3', desc: 'Do homework'),
    ];

    return ListView.separated(
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(todos[index].id),
            child: TodoItem(todo: todos[index]),
            onDismissed: (_) {},
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        primary: false,
        shrinkWrap: true,
        itemCount: todos.length);
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}
