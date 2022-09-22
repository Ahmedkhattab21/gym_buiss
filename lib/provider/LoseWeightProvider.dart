

import 'package:flutter/material.dart';

import '../model/db.dart';
import '../model/person.dart';

class LosingProvider extends ChangeNotifier{
  List<Person> pperson=[];
  var Datesss=["2/3","3/4","2/4/4444"];
  Future<void> getDataOfLoseWeight()async{
    try{
      List<Map<String, dynamic>>? per = await DBHelper.queryLose();
      pperson.clear();
      pperson.addAll(per.map((data) =>Person.fromJson(data)).toList());
      notifyListeners();
    }catch(e){
      print(e);}
  }

}
