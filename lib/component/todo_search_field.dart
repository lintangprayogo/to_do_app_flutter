import 'package:flutter/material.dart';

class TodoSearchField extends StatefulWidget {
  const TodoSearchField({super.key});

  @override
  State<TodoSearchField> createState() => _TodoSearchFieldState();
}

class _TodoSearchFieldState extends State<TodoSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
            labelText: 'Search todos...',
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value){

          },
    );
  }
}
