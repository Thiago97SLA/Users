import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:users/src/model/User.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'User_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE User('
          'id INTEGER PRIMARY KEY,'
          'email TEXT,'
          'name TEXT,'
          'phone TEXT'
          ')');
    });
  }

  createUser(User newUser) async {
    await deleteAllUsers();
    final db = await database;
    final res = await db.insert('User', newUser.toJson());
    return res;
  }

  Future<int> deleteAllUsers() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM User');
    return res;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM User");
    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<User>> searchUser(String keyword) async {
    final db = await database;
    List<Map<String, dynamic>> res =
        await db.query('User', where: 'name LIKE ?', whereArgs: ['%$keyword%']);
    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
    return list;
  }
}
