import 'package:to_do_app/data/repo/repo.dart';
import 'package:to_do_app/domain/models/todo.dart';

class UpdateUseCase {
  final Repo _repo;

  UpdateUseCase({required Repo repo}) : _repo = repo;

  Future invoke(Todo todo) async {
    await _repo.update(todo);
  }
}
