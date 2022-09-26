import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';

import '../../model/db.dart';


class SearchProvider extends ChangeNotifier{
  List<Person> pperson=[];
  List<attendance>  Datesss=[];
  int vvb=-1;

  Future<void> getDates(int id)async{
    try{
      List<Map<String,dynamic>>? dat=await DBHelper.queryDates(id);
      Datesss.clear();
      Datesss.addAll(dat.map((date) => attendance.fromJson(date)).toList());
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  Future<void> ssearchinDatabase(BuildContext context,[int id=0])async{
    try{
      List<Map<String, dynamic>>? per = await DBHelper.queryItem(id);
      print("per $per");
      if(per!.isNotEmpty){
        vvb=0;
        pperson.clear();
        pperson.addAll(per.map((data) {
          getDates(data['id']).then((_) {
            List<String> mm=[];
            for(var i in Datesss){
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
        }));

        notifyListeners();
      }else{
        vvb=-1;
        notifyListeners();
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<void> Delete(int? id)async{
    await DBHelper.delete(id!);
    await DBHelper.deleteDates(id);
  }
}

