part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.started() = _Started;
  const factory TodoEvent.remove(Todo todo) = _Remove;
  const factory TodoEvent.insert(Todo todo) = _Insert;
  const factory TodoEvent.update(Todo todo) = _Update;
  const factory TodoEvent.getData() = _GetData;
}
