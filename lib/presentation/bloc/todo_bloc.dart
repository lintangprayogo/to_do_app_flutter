import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:to_do_app/domain/models/todo.dart';
import 'package:to_do_app/domain/usecase/delete_use_case.dart';
import 'package:to_do_app/domain/usecase/get_data_use_case.dart';
import 'package:to_do_app/domain/usecase/insert_use_case.dart';
import 'package:to_do_app/domain/usecase/update_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.freezed.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetDataUseCase _getDataUseCase;
  final InsertUseCase _insertUseCase;
  final DeleteUseCase _deleteUseCase;
  final UpdateUseCase _updateUseCase;

  TodoBloc(this._getDataUseCase, this._insertUseCase, this._deleteUseCase,
      this._updateUseCase)
      : super(const TodoState()) {
    on<TodoEvent>((event, emit) async {
      await event.when(
        started: () {},
        remove: (Todo todo) async {
          await _deleteData(todo, emit);
        },
        insert: (Todo todo) async {
          await _insertData(todo, emit);
        },
        getData: () async {
          await _getData(emit);
        },
        update: (todo) async {
          await _updateData(todo, emit);
        },
      );
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
          status: TodosOverviewStatus.success, todos: state.todos + [todo]));
    } catch (e) {
      if (kDebugMode) {
        print("error insert data");
      }
    }
  }

  Future _deleteData(Todo todo, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodosOverviewStatus.loading));

    try {
      _deleteUseCase.invoke(todo);
      var newList = [...state.todos];
      newList.remove(todo);
      emit(state.copyWith(status: TodosOverviewStatus.success, todos: newList));
    } catch (e) {
      if (kDebugMode) {
        print("error delete data");
      }
    }
  }

  Future _updateData(Todo todo, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodosOverviewStatus.loading));
    try {
      await _updateUseCase.invoke(todo);
      var newList = [...state.todos];
      newList[newList.indexWhere((e) => e.id == e.id)] = todo;
      emit(state.copyWith(status: TodosOverviewStatus.success, todos: newList));
    } catch (e) {
      if (kDebugMode) {
        print("error update data");
      }
    }
  }
}
