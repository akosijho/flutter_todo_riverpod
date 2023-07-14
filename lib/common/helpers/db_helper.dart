import 'package:flutter_todo_riverpod/common/models/task.dart';
import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:sqflite/sql.dart';

/*
* Helper class of sqflite
* */
class DBHelper {
  /*
  * Defining schema
  * */
  static Future<void> createTables(sqlite.Database database) async {
    await database.execute("CREATE TABLE todos("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title STRING, description TEXT, date STRING, "
        "startTime STRING, endTime STRING, "
        "remind INTEGER, repeat STRING, "
        "isCompleted INTEGER"
        ")");

    await database.execute("CREATE TABLE users("
        "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
        "isVerified INTEGER DEFAULT 0"
        ")");
  }

  /*
  * Creating database
  * */
  static Future<sqlite.Database> db() async {
    return sqlite.openDatabase("todo_riverpod", version: 1,
        onCreate: (sqlite.Database database, int version) async {
      await createTables(database);
    });
  }

  /*
  * Tasker
  * */
  static Future<int> createItem(Task task) async {
    /*
    * Creates local database
    * */
    final db = await DBHelper.db();

    /*
    * Inserts and item into a table which return the id of the
    * inserted item
    * */
    final id = await db.insert('todos', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
  }

  /*
  * Tasker
  * */
  static Future<int> createUser(int isVerified, Task task) async {
    /*
    * Creates local database
    * */
    final db = await DBHelper.db();

    final data = {"id": 1, "isVerified": isVerified};

    /*
    * Inserts and item into a table which return the id of the
    * inserted item
    * */
    final id = await db.insert('user', data,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
  }

  /*
  * Tasker -> Get list of users
  * */
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await DBHelper.db();
    return db.query('users', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();
    return db.query('todos', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(
      {required String id}) async {
    final db = await DBHelper.db();
    return db.query('users', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(Task task) async {
    final db = await DBHelper.db();

    final results =
    await db.update('todos', {
      'title': task.title,
      'description': task.description,
      'isCompleted': task.isCompleted,
      'date': task.date,
      'startTime': task.startTime,
      'endTime': task.endTime,
    }, where: 'id = ?', whereArgs: [task.id]);

    return results;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DBHelper.db();
    try {
      await db.delete('todos', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }
}
