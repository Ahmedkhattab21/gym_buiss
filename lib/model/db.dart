import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? db;
  static const int _version=1;
  static const String _tabeName='persons';

  Future<void> initDb()async{
    if(db != null){
      debugPrint("is created");
    }else{
      try{
        String _path=await getDatabasesPath()+'person.db';
        db=await openDatabase(_path,version: _version,onCreate:(Database db, int version)async{
          await db.execute(
              'CREATE TABLE $_tabeName ('
                  'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                  ' name TEXT, date TEXT, height DOUBLE,'
                  'weight DOUBLE, age DOUBLE, payed INTEGER, days INTEGER , type INTEGER)'
          );
        });
      }catch(e){
        print(e);
      }
    }
  }
 Future<int> insert(Person person)async{
   return await db!.insert(_tabeName, person.toJson());
  }

  Future<List<Map<String,dynamic>>> queryItem(int i)async{
    return await db!.query(_tabeName,where:'id = ?' ,whereArgs:[i] );
  }

  Future<List<Map<String,dynamic>>> query()async{
   return await db!.query(_tabeName);
  }

  Future<int> update(Person person)async{
    return await db!.update(_tabeName,person.toJson(), where:'id = ?' ,whereArgs: [person.id]);
  }
  Future<int> delete(Person person)async{
    return await db!.delete(_tabeName, where:'id = ?' ,whereArgs: [person.id]);
  }





}