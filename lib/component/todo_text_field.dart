import 'package:flutter/material.dart';

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
      onSubmitted: (value) {},
    );
  }
}
