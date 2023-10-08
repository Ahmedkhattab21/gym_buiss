import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelper{
  static Database? _database;
  static const int _version=1;
  static const String _tabeName='persons';
  static const String _tablelName2='attendancePerson';

  static Future<void> initDb()async {
    if (_database != null) {
      debugPrint("is created");
    } else {
      try {
        sqfliteFfiInit();
        final databaseFactory = databaseFactoryFfi;
        _database = await databaseFactory.openDatabase(
          inMemoryDatabasePath,
          options: OpenDatabaseOptions(
            onCreate: (Database db, int version)async{
              await db.execute(
                  'CREATE TABLE $_tabeName ('
                      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                      'name TEXT ,date TEXT,height REAL,'
                      'weight REAL ,age REAL ,payed INTEGER ,days INTEGER ,type INTEGER )'
              );
              await db.execute(
                  'CREATE TABLE $_tablelName2 ('
                      'person_id INTEGER,atten_days TEXT ,'
                      'FOREIGN KEY (person_id) '
                      'REFERENCES $_tabeName (id) )'
              );
            },
            version: _version,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }

 static Future<int> insert({required Person? person})async{
   return await _database!.insert(_tabeName, person!.toJson());
  }

  static Future<List<Map<String,dynamic>>>? queryItem(int id)async{
    return await _database!.query(_tabeName,where:'id = ?' ,whereArgs:[id] );
  }

  static Future<List<Map<String,dynamic>>>? querydays(int id)async{
    return await _database!.rawQuery('''
    SELECT days FROM $_tabeName 
    WHERE id = ?
    ''',
      [id]
    );
  }
  static Future<List<Map<String,dynamic>>>? queryStartDate(int id)async{
    return await _database!.rawQuery('''
    SELECT date FROM $_tabeName 
    WHERE id = ?
    ''',
        [id]
    );
  }
  static Future<int?> updateStartDate(int id,String date)async{
    return await _database!.rawUpdate('''
    UPDATE $_tabeName 
    SET date = ?
    WHERE id = ?
    ''',
        [date,id]
    );
  }

  static Future<List<Map<String,dynamic>>>? queryPayed(int id)async{
    return await _database!.rawQuery('''
    SELECT payed FROM $_tabeName 
    WHERE id = ?
    ''',
        [id]
    );
  }

  static Future<List<Map<String,dynamic>>> queryLose()async{
    return await _database!.query(_tabeName,where: 'type = ?',whereArgs: [0]);
  }
  static Future<List<Map<String,dynamic>>> queryOver()async{
    return await _database!.query(_tabeName,where: 'type = ?',whereArgs: [1]);
  }
  static Future<List<Map<String,dynamic>>> queryDates(int id)async{
    return await _database!.query(_tablelName2,where: 'person_id = ?',whereArgs: [id]);
  }


  static Future<int> attendanceDates(attendance A)async{
    return await _database!.insert(_tablelName2 ,A.toJson());
  }
  static Future<List<Map<String, Object?>>> count()async{
   return await _database!.rawQuery("SELECT * FROM $_tabeName ORDER BY id DESC LIMIT 1");
 }
  static Future<int> updatePayed(int id,int payed) async {
      return await _database!.rawUpdate(
        '''
      UPDATE $_tabeName
      SET payed = ?
      WHERE id = ?
      ''',
        [payed, id],
      );
    }

  static Future<int> update(int id,Person person)async{
    return await _database!.rawUpdate(
      '''
      UPDATE $_tabeName
      SET name = ? , date = ? , height = ? , weight = ? , age = ? , days = ? , type = ? , payed = ? WHERE id = ?
      ''' ,
      [person.name,person.date,person.height,person.weight,person.age,
        person.days,person.type,person.payed,id]);
  }
  static Future<int> delete( int id)async{
    return await _database!.delete(_tabeName, where:'id = ?' ,whereArgs: [id]);
  }
  static Future<int> deleteDates(int id)async{
    return await _database!.delete(_tablelName2, where:'person_id = ?' ,whereArgs: [id]);
  }






}
