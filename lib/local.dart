import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Person {
  int id;
  String name;
  int age;

  Person({required this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}

class DbHelper {
  static final _databaseName = "person.db";
  static final _databaseVersion = 1;

  static final table = 'person';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // Singleton DatabaseHelper
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  late Database _database;

  Future<Database> get database async {
    if (_database == null) _database = await _initDatabase();
    return Future.value(_database);
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
  }

  // CRUD operations

  Future<int> insert(Person person) async {
    Database db = await instance.database;
    person.id = await db.rawInsert(
        'INSERT Into $table ($columnName, $columnAge) VALUES(?,?)',
        [person.name, person.age]);
    return person.id;
  }

  Future<List<Person>> queryAll() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Person(
        name: maps[i]['name'],
        age: maps[i]['age'],
        id: maps[i]['id'],
      );
    });
  }

  Future<int> update(Person person) async {
    final db = await instance.database;
    return await db.update(
      table,
      person.toMap(),
      where: '$columnId = ?',
      whereArgs: [person.id],
    );
  }

  Future<void> delete(int id) async {
    final db = await instance.database;
    await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
