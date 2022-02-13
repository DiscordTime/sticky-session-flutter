
import 'package:flutter_sticky_session/data/local/meeting_db_entity.dart';
import 'package:flutter_sticky_session/data/session.dart';
import 'package:flutter_sticky_session/data/sticky.dart';
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

          await db.execute('''CREATE TABLE sticky(
            id TEXT PRIMARY KEY,
            content TEXT,
            user TEXT,
            session_id TEXT NOT NULL
          );''');
          // FOREIGN KEY (session_id) REFERENCES session (id) ON UPDATE CASCADE ON DELETE CASCADE

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
        version: 1,
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

  insertSticky(List<Sticky> stickies) async {
    var db = await database;
    for (var sticky in stickies) {
      await db.insert(
          'sticky',
          sticky.toMap(),
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
    print("sessions: $maps");
    return List.generate(maps.length, (i) => Session.toCreate(maps[i]));
  }

  Future<List<MeetingDbEntity>> getMeetings() async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query('meeting');
    return List.generate(maps.length, (i) => MeetingDbEntity.toCreate(maps[i]));
  }

  Future<List<Sticky>> getStickies(String sessionId) async {
    var db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
        'sticky',
        where: "session_id = ?",
        whereArgs: [sessionId]
    );
    print("sticky: $maps");
    return List.generate(maps.length, (i) => Sticky.toSticky(maps[i]));
  }
  
  deleteSession(String sessionId) async {
    var db = await database;
    db.delete('session',
        where: "id = ?",
        whereArgs: [sessionId]
    );
  }
  
}
