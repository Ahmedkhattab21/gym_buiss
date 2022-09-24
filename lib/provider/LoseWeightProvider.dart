

import 'package:flutter/material.dart';

import '../model/db.dart';
import '../model/person.dart';

class LosingProvider extends ChangeNotifier{
   int long=1;
  List<Person> pperson=[];
  List<attendance> Datesss=[];
 Future<void> getDatesLoseWeight(int id)async{
   try{
     List<Map<String,dynamic>>? dat=await DBHelper.queryDates(id);
     Datesss.clear();
     Datesss.addAll(dat.map((date) => attendance.fromJson(date)).toList());
     notifyListeners();
   }catch(e){
     print(e);
   }
  }

  Future<void> getDataOfLoseWeight()async{
    try{
      List<Map<String, dynamic>>? per = await DBHelper.queryLose();
      pperson.clear();
      pperson.addAll(per.map((data){
        print(data['name']);
         getDatesLoseWeight(data['id']).then((_){
           List<String> mm=[];
           for(var i in Datesss){
             longestDates(Datesss.length);
             print(long);
             print(i.atten_days);
             mm.add(i.atten_days);
           }
           for(var ii in pperson){
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
      print(e);}
  }

  longestDates(int cc){
   if(cc>=long){
     long=cc;
   }
   notifyListeners();
  }
}
