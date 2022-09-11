import 'package:flutter/material.dart';
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
                  'weight DOUBLE, age DOUBLE, days INTEGER , type INTEGER)'
          );
        });
      }catch(e){
        print(e);
      }
    }
  }

}