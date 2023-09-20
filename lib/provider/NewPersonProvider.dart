
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym2/model/person.dart';
import 'package:intl/intl.dart';

import '../../model/db.dart';


class NewPersonProvider extends ChangeNotifier{
  List<Person> pp=[];
  TextEditingController nameController=TextEditingController();
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController age=TextEditingController();
  DateTime selectedDate=DateTime.now();


  int? selectedDays;

  List<int> daysList=[
    3,
    4,
    6
  ];
  String? selectedType;

  List<String> typeList=[
    "تخسيس",
    "حديد"
  ];
  String? selectedPayed;

  List<String> payed=[
    "دفع",
    "لم يدفع"
  ];

  clearData(){
    nameController.clear();
    heightController.clear();
    weightController.clear();
    age.clear();
    selectedDays=null;
    selectedType=null;
    selectedPayed=null;
  }

  validateAddItem(BuildContext context){
    try{
      if(nameController.text.isNotEmpty && heightController.text.isNotEmpty && weightController.text.isNotEmpty && age.text.isNotEmpty
          &&  getDouble(heightController) != -1 && getDouble(weightController) !=-1 && getDouble(age) !=-1
      ){
        addToDatabase();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("تم اضافة الشخص",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 2),
            ));
            nameController.clear();
            heightController.clear();
            weightController.clear();
            age.clear();
      } else if(nameController.text.isEmpty || heightController.text.isEmpty || weightController.text.isEmpty || age.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("اكمل جميع البيانات",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 3),
            ));
      }else if(getDouble(heightController) == -1 || getDouble(weightController) ==-1 || getDouble(age) ==-1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل الارقام صحيحه",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 3),
            ));
        if(getDouble(heightController) == -1){
          heightController.clear();
        }
        if(getDouble(weightController) ==-1 ){
          weightController.clear();
        }
        if(getDouble(age) ==-1){
          age.clear();
        }
      }

      notifyListeners();
    }catch(e){
      print(e);
    }

  }


  validateUpdateItem(BuildContext context,int id )async{
    try{
      if(nameController.text.isNotEmpty && heightController.text.isNotEmpty && weightController.text.isNotEmpty && age.text.isNotEmpty
          &&  getDouble(heightController) != -1 && getDouble(weightController) !=-1 && getDouble(age) !=-1
      ){
         await updateInDataBase(id);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("تم تحديث البيانات",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 2),
            ));
        nameController.clear();
        heightController.clear();
        weightController.clear();
        age.clear();
      } else if(nameController.text.isEmpty || heightController.text.isEmpty || weightController.text.isEmpty || age.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("اكمل جميع البيانات",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 3),
            ));
      }else if(getDouble(heightController) == -1 || getDouble(weightController) ==-1 || getDouble(age) ==-1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ادخل الارقام صحيحه",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 3),
            ));
        if(getDouble(heightController) == -1){
          heightController.clear();
        }
        if(getDouble(weightController) ==-1 ){
          weightController.clear();
        }
        if(getDouble(age) ==-1){
          age.clear();
        }
      }

      notifyListeners();
    }catch(e){
      print(e);
    }

  }

  addToDatabase()async{
    try{
      int value = await DBHelper.insert(person:Person(
        name:nameController.text,
        date: DateFormat.yMd().format(selectedDate),
        height:getDouble(heightController),
        weight:getDouble(weightController) ,
        age: getDouble(age),
        payed: selectedPayed=="دفع"? 0 : 1 ,
        days: selectedDays,
        type: selectedType=="حديد"? 1 : 0 ,
      ));
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  updateInDataBase(int id)async{
     await DBHelper.update(
        id,Person(
          name:nameController.text,
          date: DateFormat.yMd().format(selectedDate),
          height:getDouble(heightController),
          weight:getDouble(weightController) ,
          age: getDouble(age),
          payed: selectedPayed=="دفع"? 0 : 1 ,
          days: selectedDays,
          type: selectedType=="حديد"? 1 : 0 ,
        )
    );
  }

  double getDouble(TextEditingController textEditingController){
    double? number1=double.tryParse(textEditingController.text);
    if(number1 != null){
     return number1; 
    }else{
      return -1;
    }
  }

  getIdData(id)async{
    if(id!=0){
      pp.clear();
      List<Map<String, dynamic>>? per = await DBHelper.queryItem(id);
      pp.addAll(per!.map((e) => Person.fromJson(e)).toList());
      List<String> ll= pp[0].date!.split('/');
      DateTime m=DateTime(int.parse(ll[2]),int.parse(ll[0]),int.parse(ll[1]));
    nameController.text =pp[0].name.toString();
    selectedDate = m;
    heightController.text=pp[0].height.toString();
    weightController.text=pp[0].weight.toString();
    age.text=pp[0].age.toString();
    selectedType= pp[0].type==0?"تخسيس":"حديد";
    selectedPayed= pp[0].payed==0?"دفع":"لم يدفع";
    }
    notifyListeners();
  }

  getDateFromUser(BuildContext context)async{
    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext ctx)=>Container(
        height: 200.h,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode : CupertinoDatePickerMode.date,
          initialDateTime: selectedDate,
          minimumYear: 2020,
          onDateTimeChanged: (DateTime d){
            selectedDate=d;
            notifyListeners();
          },),
      ),
    );
    notifyListeners();
  }

  onTap(String? x){
    selectedDays=int.parse(x!);
    notifyListeners();
  }
  onTap2(String? x){
    selectedType=x!;
    notifyListeners();
  }
  ontapp3(String? x){
    selectedPayed=x!;
    notifyListeners();
  }

}