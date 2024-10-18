import 'package:to_do_app/domain/models/todo.dart';

abstract class Repo {
  Future<void> insert(Todo todo);
  Future<List<Todo>> getData();
}
