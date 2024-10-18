import 'package:flutter/material.dart';
import 'package:to_do_app/domain/models/todo.dart';
import 'package:to_do_app/presentation/bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoTextField extends StatefulWidget {
  const TodoTextField({super.key});

  @override
  State<TodoTextField> createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<TodoTextField> {
  final TextEditingController todoContoller = TextEditingController();

  @override
  void dispose() {
    todoContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: "What to do ?"),
      controller: todoContoller,
      keyboardType: TextInputType.text,
      onEditingComplete: () {
        context.read<TodoBloc>().add(
            TodoEvent.insert(Todo(desc: todoContoller.text, id: uuid.v4())));
      },
    );
  }
}
