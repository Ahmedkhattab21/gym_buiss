import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as windows;
import 'package:sqflite/sqflite.dart' as android;

import 'package:path/path.dart';

class DBHelper {
  static windows.Database? _windowsDatabase;
  static android.Database? _androidDatabase;
  static const int _version = 1;
  static const String _tabeName = 'persons';
  static const String _tablelName2 = 'attendancePerson';

  static Future<void> initDb() async {
    if (Platform.isAndroid) {
      if (_androidDatabase != null) {
        debugPrint("is created");
      } else {
        print(12345);
        debugPrint("not created");
        try {
          var databasesPath = await android.getDatabasesPath();
          String path = join(databasesPath, 'demo.db');

          _androidDatabase = await android.openDatabase(path, version: _version,
              onCreate: (android.Database db, int version) async {
            // When creating the db, create the table
            await db.execute('CREATE TABLE $_tabeName ('
                'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'name TEXT ,date TEXT,height REAL,'
                'weight REAL ,age REAL ,payed INTEGER ,days INTEGER ,type INTEGER )');
            await db.execute('CREATE TABLE $_tablelName2 ('
                'person_id INTEGER,atten_days TEXT ,'
                'FOREIGN KEY (person_id) '
                'REFERENCES $_tabeName (id) )');
          });
        } catch (e) {
          print(e);
        }
      }
    } else {
      if (_windowsDatabase != null) {
        debugPrint("is created");
      } else {
        debugPrint("not created");
        try {
          windows.sqfliteFfiInit();
          final databaseFactory = windows.databaseFactoryFfi;
          final dbPath = await databaseFactory.getDatabasesPath();
          final path = join(dbPath, 'gym_management.db');

          _windowsDatabase = await databaseFactory.openDatabase(
            path,
            options: windows.OpenDatabaseOptions(
              onCreate: (windows.Database db, int version) async {
                await db.execute('CREATE TABLE $_tabeName ('
                    'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                    'name TEXT ,date TEXT,height REAL,'
                    'weight REAL ,age REAL ,payed INTEGER ,days INTEGER ,type INTEGER )');
                await db.execute('CREATE TABLE $_tablelName2 ('
                    'person_id INTEGER,atten_days TEXT ,'
                    'FOREIGN KEY (person_id) '
                    'REFERENCES $_tabeName (id) )');
              },
              version: _version,
            ),
          );
        } catch (e) {
          print(e);
        }
      }
    }
  }

  static Future<int> insert({required Person? person}) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!.insert(_tabeName, person!.toJson());
    } else {
      return await _windowsDatabase!.insert(_tabeName, person!.toJson());
    }
  }

  static Future<List<Map<String, dynamic>>>? queryItem(int id) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .query(_tabeName, where: 'id = ?', whereArgs: [id]);
    } else {
      return await _windowsDatabase!
          .query(_tabeName, where: 'id = ?', whereArgs: [id]);
    }
  }

  static Future<List<Map<String, dynamic>>>? querydays(int id) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!.rawQuery('''
    SELECT days FROM $_tabeName 
    WHERE id = ?
    ''', [id]);
    } else {
      return await _windowsDatabase!.rawQuery('''
    SELECT days FROM $_tabeName 
    WHERE id = ?
    ''', [id]);
    }
  }

  static Future<List<Map<String, dynamic>>>? queryStartDate(int id) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!.rawQuery('''
    SELECT date FROM $_tabeName 
    WHERE id = ?
    ''', [id]);
    } else {
      return await _windowsDatabase!.rawQuery('''
    SELECT date FROM $_tabeName 
    WHERE id = ?
    ''', [id]);
    }
  }

  static Future<int?> updateStartDate(int id, String date) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!.rawUpdate('''
    UPDATE $_tabeName 
    SET date = ?
    WHERE id = ?
    ''', [date, id]);
    } else {
      return await _windowsDatabase!.rawUpdate('''
    UPDATE $_tabeName 
    SET date = ?
    WHERE id = ?
    ''', [date, id]);
    }
  }

  static Future<List<Map<String, dynamic>>>? queryPayed(int id) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!.rawQuery('''
    SELECT payed FROM $_tabeName 
    WHERE id = ?
    ''', [id]);
    } else {
      return await _windowsDatabase!.rawQuery('''
    SELECT payed FROM $_tabeName 
    WHERE id = ?
    ''', [id]);
    }
  }

  static Future<List<Map<String, dynamic>>> queryLose() async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .query(_tabeName, where: 'type = ?', whereArgs: [0]);
    } else {
      return await _windowsDatabase!
          .query(_tabeName, where: 'type = ?', whereArgs: [0]);
    }
  }

  static Future<List<Map<String, dynamic>>> queryOver() async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .query(_tabeName, where: 'type = ?', whereArgs: [1]);
    } else {
      return await _windowsDatabase!
          .query(_tabeName, where: 'type = ?', whereArgs: [1]);
    }
  }

  static Future<List<Map<String, dynamic>>> queryDates(int id) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .query(_tablelName2, where: 'person_id = ?', whereArgs: [id]);
    } else {
      return await _windowsDatabase!
          .query(_tablelName2, where: 'person_id = ?', whereArgs: [id]);
    }
  }

  static Future<int> attendanceDates(attendance A) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!.insert(_tablelName2, A.toJson());
      ;
    } else {
      return await _windowsDatabase!.insert(_tablelName2, A.toJson());
    }
  }

  static Future<List<Map<String, Object?>>> count() async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .rawQuery("SELECT * FROM $_tabeName ORDER BY id DESC LIMIT 1");
    } else {
      return await _windowsDatabase!
          .rawQuery("SELECT * FROM $_tabeName ORDER BY id DESC LIMIT 1");
    }
  }

  static Future<int> updatePayed(int id, int payed) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!.rawUpdate(
        '''
      UPDATE $_tabeName
      SET payed = ?
      WHERE id = ?
      ''',
        [payed, id],
      );
    } else {
      return await _windowsDatabase!.rawUpdate(
        '''
      UPDATE $_tabeName
      SET payed = ?
      WHERE id = ?
      ''',
        [payed, id],
      );
    }
  }

  static Future<int> update(int id, Person person) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .delete(_tabeName, where: 'id = ?', whereArgs: [id]);
    } else {
      return await _windowsDatabase!
          .delete(_tabeName, where: 'id = ?', whereArgs: [id]);
    }
  }

  static Future<int> delete(int id) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .delete(_tabeName, where: 'id = ?', whereArgs: [id]);
    } else {
      return await _windowsDatabase!
          .delete(_tabeName, where: 'id = ?', whereArgs: [id]);
    }
  }

  static Future<int> deleteDates(int id) async {
    if (Platform.isAndroid) {
      return await _androidDatabase!
          .delete(_tablelName2, where: 'person_id = ?', whereArgs: [id]);
    } else {
      return await _windowsDatabase!
          .delete(_tablelName2, where: 'person_id = ?', whereArgs: [id]);
    }
  }
}
