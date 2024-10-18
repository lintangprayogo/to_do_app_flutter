import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:to_do_app/domain/models/todo.dart';
import 'package:to_do_app/domain/usecase/get_data_use_case.dart';
import 'package:to_do_app/domain/usecase/insert_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.freezed.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetDataUseCase _getDataUseCase;
  final InsertUseCase _insertUseCase;

  TodoBloc(this._getDataUseCase, this._insertUseCase)
      : super(const TodoState()) {
    on<TodoEvent>((event, emit) async {
      await event.when(
          started: () {},
          remove: (String id) async {},
          insert: (Todo todo) async {
            await _insertData(todo, emit);
          },
          getData: () async {
            await _getData(emit);
          });
    });
  }

  Future _getData(Emitter<TodoState> emit) async {
    Logger.root.level = Level.ALL; // defaults to Level.INFO

    emit(state.copyWith(status: TodosOverviewStatus.loading));
    try {
      final todos = await _getDataUseCase.invoke();
      emit(state.copyWith(status: TodosOverviewStatus.success, todos: todos));
    } catch (e) {
      if (kDebugMode) {
        print("error insert data");
      }
    }
  }

  Future _insertData(Todo todo, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodosOverviewStatus.loading));
    try {
      await _insertUseCase.invoke(todo);
      emit(state.copyWith(
          status: TodosOverviewStatus.success, todos:  state.todos..add(todo)));
    } catch (e) {
      if (kDebugMode) {
        print("error insert data");
      }
    }
  }
}
