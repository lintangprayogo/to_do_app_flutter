import 'package:sqflite/sqflite.dart';

const idColumn = "id";
const tableTodo = "todos";
const descColumn = "desc";
const doneColumn = "done";

class TodoDatabase {
  Database? db;

  Future open() async {
    String path = '${await getDatabasesPath()}tasks.db';

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        create table $tableTodo($idColumn String PRIMARY KEY, $descColumn Text , $doneColumn Bool)
        ''');
      },
    );
  }
}
