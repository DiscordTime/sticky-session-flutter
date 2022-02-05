
import 'package:flutter_sticky_session/data/session.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  late Database _database;

  Future<Database> get database async {
    final status = await databaseExists(await getDatabasesPath());
    if (!status) {
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database> createDatabase() async {
      return await openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        print("create DB");
        return db.execute(
          '''CREATE TABLE session(
            id TEXT PRIMARY KEY,
            meetingId TEXT,
            name TEXT,
            description TEXT,
            highlight TEXT,
            answer INTEGER
          )''',
        );
      },
      version: 1,
    );
  }

  insertSession(Session session) async {
    var db = await database;
    await db.insert(
      'session', 
      session.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Session>> getSessions() async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query('session'); 
    return List.generate(maps.length, (i) => Session(
      id: maps[i]['id'],
      meetingId: maps[i]['meetingId'],
      name: maps[i]['name'],
      description: maps[i]['description'],
      highlight: maps[i]['highlight'],
      answer: maps[i]['answer']
    ));
  }
}
