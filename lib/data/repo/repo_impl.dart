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
  Future<void> insert(Todo todo) {
    return _localDataSource.insert(todo);
  }
}
