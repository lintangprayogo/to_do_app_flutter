import 'package:to_do_app/data/repo/repo.dart';
import 'package:to_do_app/domain/models/todo.dart';

class InsertUseCase {
  final Repo _repo;

  InsertUseCase({required Repo repo}) : _repo = repo;

  Future invoke(Todo todo) async {
    await _repo.insert(todo);
  }
}
