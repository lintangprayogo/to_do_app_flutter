part of 'todo_bloc.dart';

enum TodosOverviewStatus { initial, loading, success, failure }

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default(TodosOverviewStatus.initial)  TodosOverviewStatus status ,
    @Default([]) List<Todo> todos
  })=_TodoState;
}
