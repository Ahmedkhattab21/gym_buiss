

import 'package:flutter/material.dart';

import '../model/db.dart';
import '../model/person.dart';

class LosingProvider extends ChangeNotifier{
   int long=0;
  List<Person> person=[];
  List<attendance> dates=[];
 Future<void> getDatesLoseWeight(int id)async{
   try{
     List<Map<String,dynamic>>? dat=await DBHelper.queryDates(id);
     dates.clear();
     dates.addAll(dat.map((date) => attendance.fromJson(date)).toList());
     notifyListeners();
   }catch(e){
     print(e);
   }
  }

  Future<void> getDataOfLoseWeight()async{
    try{
      List<Map<String, dynamic>>? per = await DBHelper.queryLose();
      person.clear();
      person.addAll(per.map((data){
         getDatesLoseWeight(data['id']).then((_){
           List<String> mm=[];
           for(var i in dates){
             longestDates(dates.length);
             mm.add(i.atten_days);
           }
           for(var ii in person){
             if(ii.id == data['id']){
               ii.atten_day=mm;
             }
           }
           mm=[];
         });
        return Person.fromJson(data);
      }
      ));
      notifyListeners();
    }catch(e){
       print(e);
    }
  }

  longestDates(int cc){
   if(cc>=long){
     long=cc;
   }
   notifyListeners();
  }
}
