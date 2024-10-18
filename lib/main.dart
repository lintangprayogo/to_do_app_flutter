import 'package:flutter/material.dart';
import 'package:to_do_app/di/locator.dart';
import 'package:to_do_app/presentation/bloc/todo_bloc.dart';
import 'package:to_do_app/presentation/page/todo_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => locator()..add(const TodoEvent.getData()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoPage(),
      ),
    );
  }
}
