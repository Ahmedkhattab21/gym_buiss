import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/db.dart';
import '../model/person.dart';


class AttendanceProvider extends ChangeNotifier{
  TextEditingController controller=TextEditingController();

  valedaate(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1 && getDouble(controller) <= await count() && await count() !=-1){
        addAttendanceToDatabase();
        controller.clear();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Attendance was Added ",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }else if(controller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Number must be Added",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 2),
            ));
      }else if(getDouble(controller) == -1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Enter the number of the person",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }else if( getDouble(controller) >= await count() || await count() ==-1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Enter the correct number",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  addAttendanceToDatabase()async{
    try{
      int value = await DBHelper.attendanceDates(attendance(person_id:int.parse(controller.text), atten_days: DateFormat.yMd().format(DateTime.now()).toString()));
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  Future<int> count()async {
    int? x=await DBHelper.count();
    if(x !=null){
      return x;
    }else{
      return -1;
    }
  }

  payedValidate(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1 &&await payed(int.parse(controller.text)) == 1 ){
        payed(int.parse(controller.text));
        controller.clear();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Person was Payed",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }else if(controller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Number must be Added",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }else if(await payed(int.parse(controller.text)) == -1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Enter the number of the person",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  Future payed(int id)async{
     int xx= await DBHelper.updatePayed(id);
     if(xx == 1){
       return xx;
     }else{
       return -1;
     }
  }

  double getDouble(TextEditingController){
    double? number1= double.tryParse(TextEditingController.text as String)??null;
    if(number1 != null && number1 != 0){
      return number1;
    }else{
      return -1;
    }
  }
}