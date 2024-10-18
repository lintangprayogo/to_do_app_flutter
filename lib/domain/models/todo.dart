import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

Uuid uuid = const Uuid();

@freezed
class Todo with _$Todo {
  factory Todo(
      {required String desc,
      required String id,
      @Default(false) bool done}) = _Todo;


}
