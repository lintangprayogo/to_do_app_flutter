part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.started() = _Started;
  const factory TodoEvent.remove(String id) = _Remove;
  const factory TodoEvent.insert(Todo todo) = _Insert;
  const factory TodoEvent.getData() = _GetData;
}
