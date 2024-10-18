import 'package:to_do_app/data/localdatasource/db/todo_database.dart';
import 'package:to_do_app/data/localdatasource/local_data_source.dart';
import 'package:to_do_app/domain/models/todo.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final TodoDatabase todoDatabase;

  LocalDataSourceImpl({required this.todoDatabase});

  @override
  Future<void> insert(Todo todo) async {
    if (todoDatabase.db == null) {
      await todoDatabase.open();
    }
    todoDatabase.db!.insert(
        tableTodo,
        Map.of(
            {idColumn: todo.id, descColumn: todo.desc, doneColumn: todo.done}));
  }

  @override
  Future<List<Todo>> getData() async {
    if (todoDatabase.db == null) {
      await todoDatabase.open();
    }
    List<Map<String, dynamic>> maps = await todoDatabase.db!
        .query(tableTodo, columns: [idColumn, descColumn, doneColumn]);
    return maps
        .map((e) => Todo(desc: e["desc"], id: e["id"], done: false))
        .toList();
  }

  @override
  Future<void> delete(String id) async {
    if (todoDatabase.db == null) {
      await todoDatabase.open();
    }
    todoDatabase.db!.delete(tableTodo, where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<void> update(Todo todo) async {
    if (todoDatabase.db == null) {
      await todoDatabase.open();
    }
    todoDatabase.db!.update(
        tableTodo, Map.of({descColumn: todo.desc, doneColumn: todo.done}),
        where: "id = ?", whereArgs: [todo.id]);
  }
}
