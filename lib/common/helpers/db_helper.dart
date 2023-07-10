import 'package:sqflite/sqflite.dart' as sqlite;

class DBHelper {
  static Future<void> createTables(sqlite.Database database) async {
    await database.execute("CREATE TABLE todos("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "title STRING, description TEXT, date STRING, "
      "startTime STRING, endTime STRING, "
      "remind INTEGER, repeat STRING, "
      "isCompleted INTEGER"
        ")"
    );
  }
}
