import 'package:to_do_app/data/repo/repo.dart';
import 'package:to_do_app/domain/models/todo.dart';

class DeleteUseCase {
  final Repo _repo;

  DeleteUseCase({required Repo repo}) : _repo = repo;

  Future invoke(Todo todo) async {
    await _repo.delete(todo.id);
  }
}
