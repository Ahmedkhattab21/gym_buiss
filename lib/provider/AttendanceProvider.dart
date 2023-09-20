
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym2/view/screens/Attendance.dart';
import 'package:gym2/view/screens/LoseWeight.dart';
import 'package:gym2/view/screens/NewPerson.dart';
import 'package:gym2/view/screens/OverWeight.dart';
import 'package:intl/intl.dart';

import '../model/db.dart';
import '../model/person.dart';


class AttendanceProvider extends ChangeNotifier{
  TextEditingController controller=TextEditingController();

  int currIndex=0 ;

  changeCurrentIndex(int value){
    currIndex=value;
    notifyListeners();
  }

  getAppBars(BuildContext context)=>[
    AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("الحضور",style: Theme.of(context).textTheme.headline2,),
      actions:  [
        const CircleAvatar(
          backgroundImage:AssetImage("assets/images/img1.jpg"),),
        SizedBox(width: 20.w),
      ],
    ),
    AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("اضافة عميل",style: Theme.of(context).textTheme.headline2,),
      actions: const [
        CircleAvatar(
          backgroundImage:AssetImage("assets/images/img1.jpg"),),
        SizedBox(width: 20,),
      ],
    ),
    AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("تخسيس",style: Theme.of(context).textTheme.headline2,),
      actions: const [
        CircleAvatar(
          backgroundImage:AssetImage("assets/images/img1.jpg"),),
        SizedBox(width: 20,),
      ],
    ),
    AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("حديد",style: Theme.of(context).textTheme.headline2,),
      actions: const [
        CircleAvatar(
          backgroundImage:AssetImage("assets/images/img1.jpg"),),
        SizedBox(width: 20,),
      ],
    ),
  ];

  getScreens(BuildContext context)=>[
    const Attendance(),
    const NewPerson(),
    const LoseWeight(),
    const OverWeight(),
  ];


  validate(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1 && getDouble(controller) <= await count()){
        List<Map<String, dynamic>> dates = await DBHelper.queryDates(int.parse(controller.text));
        List<Map<String, dynamic>>? startDate = await DBHelper.queryStartDate(int.parse(controller.text));
        if(startDate!.isNotEmpty){
          List<String> li2=startDate[0]["date"].split('/');
          List<Map<String, dynamic>>? days = await DBHelper.querydays(int.parse(controller.text));
          switch(days![0]['days'] as int){
            case 3:
              if(dates.length >=12 || (DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).day <=DateTime.now().day &&
                  DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).month <DateTime.now().month )){
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("انتهي الاشتراك",style: Theme.of(context).textTheme.headline2,),
                  backgroundColor: Colors.white,
                  duration:const Duration(seconds: 2),
                ));
              }
              else{
                addAttendanceToDatabase(int.parse(controller.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("تمت الاضافة ",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));
                controller.clear();
              }
              break;
            case 4:
              if(dates.length >=16 || (DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).day <=DateTime.now().day &&
                  DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).month <DateTime.now().month )){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("انتهي الاشتراك",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));

              }
              else{
                addAttendanceToDatabase(int.parse(controller.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("تمت الاضافة ",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));
                controller.clear();
              }
              break;
            case 6:
              if(DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).day <=DateTime.now().day &&
                  DateTime.utc(int.parse(li2[2]),int.parse(li2[0]),int.parse(li2[1])).month <DateTime.now().month ){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("انتهي الاشتراك",style: Theme.of(context).textTheme.headline2,),
                      backgroundColor: Colors.white,
                      duration:const Duration(seconds: 2),
                    ));
              }
              else{
                addAttendanceToDatabase(int.parse(controller.text));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("تمت الاضافة  ",style: Theme.of(context).textTheme.headline2,),
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
                content: Text("الشخص غير موجود",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }
      }
      else if(controller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل رقم الشخص",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 2),
            ));
      }
      else if(getDouble(controller) == -1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل رقم الشخص صحيح",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      else if( getDouble(controller) >= await count()){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("رقم الشخص ليس موجود",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("حدث خطا ما حاول مره اخري",style: Theme.of(context).textTheme.headline2,),
            backgroundColor: Colors.white,
            duration:const Duration(seconds: 2),
          ));
    }
  }

  addAttendanceToDatabase(int id)async{
       await DBHelper.attendanceDates(attendance(person_id:id, atten_days: DateFormat.yMd().format(DateTime.now()).toString()));
      notifyListeners();

  }

  Future<int> count()async {
     List<Map<String,dynamic>> lastItem = await DBHelper.count();
    return lastItem[0]['id'];
  }

  payedValidate(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1  && getDouble(controller) <= await count()){
        List<Map<String, dynamic>>? pay = await DBHelper.queryPayed(int.parse(controller.text));
        if(pay!.isNotEmpty){
          switch(pay[0]['payed'] as int){
            case 0:
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("الشخص دفع بالفعل ",style: Theme.of(context).textTheme.headline2,),
                    backgroundColor: Colors.white,
                    duration:const Duration(seconds: 2),
                  ));
              break;
            case 1:
              await DBHelper.updatePayed(int.parse(controller.text),0);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("تم الدفع",style: Theme.of(context).textTheme.headline2,),
                    backgroundColor: Colors.white,
                    duration:const Duration(seconds: 2),
                  ));
              controller.clear();
              break;
          }
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("الشخص غير موجود",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }
      }
      else if(controller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل رقم الشخص",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      else if(await DBHelper.updatePayed(int.parse(controller.text),0) == 0){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل رقم الشخص صحيح",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("حدث خطا ما حاول مره اخري",style: Theme.of(context).textTheme.headline2,),
            backgroundColor: Colors.white,
            duration:const Duration(seconds: 2),
          ));
    }
  }

  double getDouble(TextEditingController textEditingController){
    double? number1= double.tryParse(textEditingController.text);
    if(number1 != null && number1 != 0){
      return number1;
    }else{
      return -1;
    }
  }


  validateSubscription(BuildContext context)async{
    try{
      if(controller.text.isNotEmpty && getDouble(controller) !=-1 && getDouble(controller) <= await count()){
        DateTime dateTime=DateTime.now();
         int? startDate = await DBHelper.updateStartDate(int.parse(controller.text),DateFormat.yMd().format(dateTime));
        if(startDate ==1){
          await DBHelper.deleteDates(int.parse(controller.text));
          await DBHelper.updatePayed(int.parse(controller.text),1);
          controller.clear();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("تم تجديد الاشتراك ",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("الشخص غير موجود",style: Theme.of(context).textTheme.headline2,),
                backgroundColor: Colors.white,
                duration:const Duration(seconds: 2),
              ));
        }
      }
      else if(controller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل رقم الشخص",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 2),
            ));
      }
      else if(getDouble(controller) == -1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل رقم الشخص صحيح",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      else if( getDouble(controller) >= await count()){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("الشخص غير موجود",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 2),
            ));
      }
      notifyListeners();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("حدث خطا ما حاول مره اخري",style: Theme.of(context).textTheme.headline2,),
            backgroundColor: Colors.white,
            duration:const Duration(seconds: 2),
          ));
    }
  }

}

