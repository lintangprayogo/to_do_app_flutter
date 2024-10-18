import 'package:to_do_app/data/localdatasource/local_data_source.dart';
import 'package:to_do_app/data/repo/repo.dart';
import 'package:to_do_app/domain/models/todo.dart';

class RepoImpl implements Repo {
  final LocalDataSource _localDataSource;

  RepoImpl({required LocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<List<Todo>> getData() async {
    return await _localDataSource.getData();
  }

  @override
  Future<void> insert(Todo todo) async {
    return await _localDataSource.insert(todo);
  }

  @override
  Future<void> delete(id) async {
    await _localDataSource.delete(id);
  }

  @override
  Future<void> update(Todo todo) async {
    await _localDataSource.update(todo);
  }
}
