import 'package:get_it/get_it.dart';
import 'package:to_do_app/data/localdatasource/local_data_source.dart';
import 'package:to_do_app/data/localdatasource/local_data_source_impl.dart';
import 'package:to_do_app/data/repo/repo.dart';
import 'package:to_do_app/data/repo/repo_impl.dart';
import 'package:to_do_app/data/localdatasource/db/todo_database.dart';
import 'package:to_do_app/domain/usecase/delete_use_case.dart';
import 'package:to_do_app/domain/usecase/get_data_use_case.dart';
import 'package:to_do_app/domain/usecase/insert_use_case.dart';
import 'package:to_do_app/domain/usecase/update_use_case.dart';
import 'package:to_do_app/presentation/bloc/todo_bloc.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<TodoDatabase>(() => TodoDatabase());
  locator.registerFactory<LocalDataSource>(
      () => LocalDataSourceImpl(todoDatabase: locator()));
  locator.registerFactory<Repo>(() => RepoImpl(localDataSource: locator()));
  locator
      .registerFactory<GetDataUseCase>(() => GetDataUseCase(repo: locator()));
  locator.registerFactory<InsertUseCase>(() => InsertUseCase(repo: locator()));
  locator.registerFactory<DeleteUseCase>(() => DeleteUseCase(repo: locator()));
  locator.registerFactory<UpdateUseCase>(() => UpdateUseCase(repo: locator()));
  locator.registerFactory<TodoBloc>(
      () => TodoBloc(locator(), locator(), locator(), locator()));
}
