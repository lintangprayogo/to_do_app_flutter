import 'package:flutter/material.dart';
import 'package:to_do_app/component/todo_filter.dart';
import 'package:to_do_app/component/todo_header.dart';
import 'package:to_do_app/component/todo_list.dart';
import 'package:to_do_app/component/todo_search_field.dart';
import 'package:to_do_app/component/todo_text_field.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TodoHeader(),
            TodoTextField(),
            TodoSearchField(),
            SizedBox(height: 10,),
            TodoFilter(),
            TodoList()
          ],
        ),
      ),
    ));
  }
}
