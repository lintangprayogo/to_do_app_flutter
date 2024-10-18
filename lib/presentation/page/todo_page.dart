import 'package:flutter/material.dart';
import 'package:to_do_app/presentation/page/component/todo_filter.dart';
import 'package:to_do_app/presentation/page/component/todo_header.dart';
import 'package:to_do_app/presentation/page/component/todo_list.dart';
import 'package:to_do_app/presentation/page/component/todo_search_field.dart';
import 'package:to_do_app/presentation/page/component/todo_text_field.dart';


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
            SizedBox(
              height: 20,
            ),
            TodoSearchField(),
            TodoFilter(),
            TodoList()
          ],
        ),
      ),
    ));
  }
}
