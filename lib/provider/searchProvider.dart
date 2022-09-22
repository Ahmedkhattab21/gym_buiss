import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';

import '../../model/db.dart';


class SearchProvider extends ChangeNotifier{

  List<Person> pperson=[];
  var Datesss=["2/3","3/4","2/4/4444"];

  Future<void> ssearchinDatabase([int id=0])async{
    try{
      List<Map<String, dynamic>>? per = await DBHelper.queryItem(id);
      print("per $per");
      if(per!.isNotEmpty){
        pperson.clear();
        pperson.addAll(per.map((data) =>Person.fromJson(data)).toList());
        print("person ${pperson[0].id}");

        notifyListeners();
      }else{
        print("Not found2");
      }
      // List<Map<String, dynamic>>? atten = await DBHelper.attendanceDates(id);
      // if(atten != null){
      //   Datesss=atten;
      // }else{
      //   print("not Found");
      // }

      // print(pperson.length);
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
}

