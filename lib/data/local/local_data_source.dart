
import 'package:flutter_sticky_session/data/local/meeting_db_entity.dart';
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
        onCreate: (db, version) async {
          print("create DB");

          await db.execute('''CREATE TABLE session(
            id TEXT PRIMARY KEY,
            meetingId TEXT,
            name TEXT,
            description TEXT,
            highlight TEXT,
            answer INTEGER
          );''');

          await db.execute('''CREATE TABLE meeting(
            id TEXT PRIMARY KEY,
            title TEXT,
            description TEXT,
            startDate TEXT,
            endDate TEXT,
            local TEXT,
            sessions INTEGER,
            people INTEGER
          );''');
        },
        version: 3,
    );
  }

  insertSession(List<Session> sessions) async {
    var db = await database;
    for (var session in sessions) {
      await db.insert(
          'session',
          session.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
  }

  insertMeeting(List<MeetingDbEntity> meetings) async {
    var db = await database;
    for (var meeting in meetings) {
      await db.insert(
          'meeting',
          meeting.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace
      );
    }
  }

  Future<List<Session>> getSessions(String meetingId) async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
        'session',
      where: "meetingId = ?",
      whereArgs: [meetingId]
    );
    return List.generate(maps.length, (i) => Session(
        id: maps[i]['id'],
        meetingId: maps[i]['meetingId'],
        name: maps[i]['name'],
        description: maps[i]['description'],
        highlight: maps[i]['highlight'],
        answer: maps[i]['answer']
    ));
  }

  Future<List<MeetingDbEntity>> getMeetings() async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query('meeting');
    return List.generate(maps.length, (i) => MeetingDbEntity(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        startDate: maps[i]['startDate'],
        endDate: maps[i]['endDate'],
        local: maps[i]['local'],
        sessions: maps[i]['sessions'],
        people: maps[i]['people']
    ));
  }
}
