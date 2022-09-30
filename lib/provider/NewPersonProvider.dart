
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym2/model/person.dart';
import 'package:intl/intl.dart';

import '../../model/db.dart';


class NewPersonProvider extends ChangeNotifier{
  List<Person> pp=[];
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
              duration: const Duration(seconds: 2),
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
              duration: const Duration(seconds: 3),
            ));
      }else if(getDouble(heightController) == -1 || getDouble(weightController) ==-1 || getDouble(age) ==-1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(" Enter Numbers !",style: Theme.of(context).textTheme.headline2,),
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
  valedaate2(BuildContext context,int id )async{
    try{
      if(nameController.text.isNotEmpty && heightController.text.isNotEmpty && weightController.text.isNotEmpty && age.text.isNotEmpty
          &&  getDouble(heightController) != -1 && getDouble(weightController) !=-1 && getDouble(age) !=-1
      ){
         await updateInDataBase(id);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Person was Updated ",style: Theme.of(context).textTheme.headline2,),
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
              content: Text("All fields are required!",style: Theme.of(context).textTheme.headline2,),
              backgroundColor: Colors.white,
              duration: const Duration(seconds: 3),
            ));
      }else if(getDouble(heightController) == -1 || getDouble(weightController) ==-1 || getDouble(age) ==-1){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(" Enter Numbers !",style: Theme.of(context).textTheme.headline2,),
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
    }catch(e){
      print(e);
    }
  }
  updateInDataBase(int id)async{
     await DBHelper.update(
        id,Person(
          name:nameController.text,
          date: DateFormat.yMd().format(selecteedDate),
          height:getDouble(heightController),
          weight:getDouble(weightController) ,
          age: getDouble(age),
          payed: selectedPayed=="payed"? 0 : 1 ,
          days: selectedDayes,
          type: selectedType=="Over"? 1 : 0 ,
        )
    );
  }

  double getDouble(TextEditingController){
    double? number1=double.tryParse(TextEditingController.text as String)??null;
    if(number1 != null){
     return number1; 
    }else{
      return -1;
    }
  }

  getIdData(id)async{
    print("jq");
    if(id!=0){
      pp.clear();
      List<Map<String, dynamic>>? per = await DBHelper.queryItem(id);
      pp.addAll(per!.map((e) => Person.fromJson(e)).toList());
      List<String> ll= pp[0].date!.split('/');
      DateTime m=DateTime(int.parse(ll[2]),int.parse(ll[0]),int.parse(ll[1]));
      print(" m${pp[0].name}");
    nameController.text =pp[0].name.toString();
    selecteedDate = m;
    heightController.text=pp[0].height.toString();
    weightController.text=pp[0].weight.toString();
    age.text=pp[0].age.toString();
    selectedType= pp[0].type==0?"Lose":"Over";
    selectedPayed= pp[0].payed==0?"payed":"Not Payed";
    }
    notifyListeners();
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