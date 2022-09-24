
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/db.dart';


class NewPersonProvider extends ChangeNotifier{
  TextEditingController nameController=TextEditingController();
  TextEditingController heightController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController age=TextEditingController();
  DateTime selecteedDate=DateTime.now();


  int selectedDayes= 3;

  List<int> daysList=[
    3,
    4,
    6
  ];
  String selectedType="Lose";

  List<String> typeList=[
    "Lose",
    "Over"
  ];
  String selectedPayed="payed";

  List<String> payed=[
    "payed",
    "Not Payed"
  ];


  valedaate(BuildContext context){
    try{
      if(nameController.text.isNotEmpty && heightController.text.isNotEmpty && weightController.text.isNotEmpty && age.text.isNotEmpty
          &&  getDouble(heightController) != -1 && getDouble(weightController) !=-1 && getDouble(age) !=-1
      ){
        addtodatabase();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Person was Added ",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: Duration(seconds: 2),
            ));
            nameController.clear();
            heightController.clear();
            weightController.clear();
            age.clear();
      } else if(nameController.text.isEmpty || heightController.text.isEmpty || weightController.text.isEmpty || age.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("All fields are required!",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: Duration(seconds: 3),
            ));
      }else if(getDouble(heightController) == -1 || getDouble(weightController) ==-1 || getDouble(age) ==-1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(" Enter Numbers !",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: Duration(seconds: 3),
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
      else{
        print("");
      }
      notifyListeners();
    }catch(e){print(e);}

  }

  addtodatabase()async{
    try{
      int value = await DBHelper.insert(person:Person(
        name:nameController.text,
        date: DateFormat.yMd().format(selecteedDate),
        height:getDouble(heightController),
        weight:getDouble(weightController) ,
        age: getDouble(age),
        payed: selectedPayed=="payed"? 0 : 1 ,
        days: selectedDayes,
        type: selectedType=="Over"? 1 : 0 ,
      ));
      print("$value");
    }catch(e){
      print(e);
    }
  }

  double getDouble(TextEditingController){
    double? number1=double.tryParse(TextEditingController.text as String)??null;
    if(number1 != null){
     return number1; 
    }else{
      return -1;
    }
  }



  getDateFromUser(BuildContext ctxx)async{
    await showCupertinoModalPopup(
      context: ctxx,
      builder: (BuildContext ctx)=>Container(
        height: 200,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode : CupertinoDatePickerMode.date,
          initialDateTime: selecteedDate,
          minimumYear: 2020,
          maximumYear: 2040,
          onDateTimeChanged: (DateTime d){
            selecteedDate=d;
            notifyListeners();
          },),
      ),
    );
    notifyListeners();
  }

  ontapp(String? x){
    selectedDayes=int.parse(x!);
    notifyListeners();
  }
  ontapp2(String? x){
    selectedType=x!;
    notifyListeners();
  }
  ontapp3(String? x){
    selectedPayed=x!;
    notifyListeners();
  }

}