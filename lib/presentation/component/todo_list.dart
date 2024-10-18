import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/presentation/component/todo_item.dart';
import 'package:to_do_app/presentation/bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(state.todos[index].id),
                child: TodoItem(todo: state.todos[index]),
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
            itemCount: state.todos.length);
      },
    );
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
