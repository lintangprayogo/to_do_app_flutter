import 'package:to_do_app/data/repo/repo.dart';
import 'package:to_do_app/domain/models/todo.dart';

class GetDataUseCase {
  final Repo _repo;

  GetDataUseCase({required Repo repo}) : _repo = repo;

  Future<List<Todo>> invoke() async {
    return await _repo.getData();
  }
}
