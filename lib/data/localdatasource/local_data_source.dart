import 'package:to_do_app/domain/models/todo.dart';

abstract class LocalDataSource {
  Future<void> insert(Todo todo);
  Future<List<Todo>> getData();
}
