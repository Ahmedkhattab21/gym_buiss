
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/db.dart';
import '../model/person.dart';


class AttendanceProvider extends ChangeNotifier{
  TextEditingController controller=TextEditingController();

  valedaate(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1 && getDouble(controller) <= await count()){
        List<Map<String, dynamic>> dates = await DBHelper.queryDates(int.parse(controller.text));
        List<Map<String, dynamic>>? startDate = await DBHelper.queryStartDate(int.parse(controller.text));

        if(startDate!.isNotEmpty){
          List<String> li2=startDate[0]["date"].split('/');
          List<Map<String, dynamic>>? days = await DBHelper.querydays(int.parse(controller.text));
          // print(startDate[0]["date"]);
          switch(days![0]['days'] as int){
            case 3:
              if(dates.length >12 || (DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).day <=DateTime.now().day &&
                  DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).month <DateTime.now().month )){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Subscribtion was End ",style: Theme.of(context).textTheme.headline2,),
                  backgroundColor: Colors.white,
                  duration:const Duration(seconds: 2),
                ));
              }else{
                addAttendanceToDatabase(int.parse(controller.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Done ",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));
                controller.clear();
              }
              break;
            case 4:
              if(dates.length >16 || (DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).day <=DateTime.now().day &&
                  DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).month <DateTime.now().month )){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("subscribtion was End ",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));

              }else{
                addAttendanceToDatabase(int.parse(controller.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Done ",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));
                controller.clear();
              }
              break;
            case 6:
              if(dates.length >28 || (DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).day <=DateTime.now().day &&
                  DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).month <DateTime.now().month )){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("subscribtion was End ",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));
              }else{
                addAttendanceToDatabase(int.parse(controller.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Done ",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));
                controller.clear();
              }
              break;
          }
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("The Person Not Found ",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }
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
      }else if( getDouble(controller) >= await count()){
        print(await count());
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("The Number Not Found",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  addAttendanceToDatabase(int id)async{
    try{
      int value = await DBHelper.attendanceDates(attendance(person_id:id, atten_days: DateFormat.yMd().format(DateTime.now()).toString()));
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  Future<int> count()async {
     List<Map<String,dynamic>> lastItem = await DBHelper.count();
    return lastItem[0]['id'];
  }

  payedValidate(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1  && getDouble(controller) <= await count()){
        List<Map<String, dynamic>>? pay = await DBHelper.queryPayed(int.parse(controller.text));
        print(pay);
        if(pay!.isNotEmpty){
          // print("ee${pay[0]['payed']}");
          switch(pay[0]['payed'] as int){
            case 0:
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Person Already Payed",style: Theme.of(context).textTheme.headline2,),
                    backgroundColor: Colors.white,
                    duration:const Duration(seconds: 2),
                  ));
              break;
            case 1:
              await DBHelper.updatePayed(int.parse(controller.text));
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Done",style: Theme.of(context).textTheme.headline2,),
                    backgroundColor: Colors.white,
                    duration:const Duration(seconds: 2),
                  ));
              controller.clear();
              break;
          }
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("The Person Not found",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }
      }else if(controller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Number must be Added",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }else if(await DBHelper.updatePayed(int.parse(controller.text)) == 0){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("The Number Not Found",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      print(e);
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
  subscribtion(BuildContext context,int id)async{
    // DateTime dateTime=DateTime.now();
    // List<Map<String, dynamic>>? startDate = await DBHelper.updateStartDate(id,DateFormat.yMd().format(dateTime));
    // print(startDate);
    // if(startDate!.isNotEmpty){
    //   print("ggg");
    //   // await DBHelper.deleteDates(id);
    //   print(await DBHelper.queryDates(id));
    // }else{
    //   print("kk not ");
    // }
    //

  }
  valedaateSubscribtion(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1 && getDouble(controller) <= await count()){

        DateTime dateTime=DateTime.now();
         int? startDate = await DBHelper.updateStartDate(int.parse(controller.text),DateFormat.yMd().format(dateTime));
        if(startDate ==1){
          await DBHelper.deleteDates(int.parse(controller.text));
          controller.clear();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Done ",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("The Number Not Found",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }
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
      }else if( getDouble(controller) >= await count()){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("The Number Not Found",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

}

