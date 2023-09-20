import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';

import '../../model/db.dart';


class SearchProvider extends ChangeNotifier{
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();

  List<Person> person=[];
  List<attendance>  dates=[];
  int vvb=-1;

  Future<void> getDates(int id)async{
      List<Map<String,dynamic>>? dat=await DBHelper.queryDates(id);
      dates.clear();
      dates.addAll(dat.map((date) => attendance.fromJson(date)).toList());
      notifyListeners();

  }

  Future<void> searchInDatabase(BuildContext context,[int id=0])async{
    try{
      List<Map<String, dynamic>>? per = await DBHelper.queryItem(id);
      if(per!.isNotEmpty){
        vvb=0;
        person.clear();
        person.addAll(per.map((data) {
          getDates(data['id']).then((_) {
            List<String> mm=[];
            for(var i in dates){
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

  Future<void> delete(int? id)async{
    try {
      await DBHelper.delete(id!);
      await DBHelper.deleteDates(id);
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  int getDouble2(String x){
    int? number1=int.tryParse(x);
    if(number1 != null){
      return number1;
    }else{
      return -1;
    }
  }

  changeState(){
    notifyListeners();
  }
}

