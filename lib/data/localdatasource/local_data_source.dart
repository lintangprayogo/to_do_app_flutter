import 'package:to_do_app/domain/models/todo.dart';

abstract class LocalDataSource {
  Future<void> insert(Todo todo);
  Future<void> update(Todo todo);
  Future<void> delete(String id);
  Future<List<Todo>> getData();
}
