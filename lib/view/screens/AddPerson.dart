import 'package:flutter/material.dart';

import '../widget/button.dart';
import '../widget/input.dart';

import 'package:intl/intl.dart';

class AddPerson extends StatefulWidget {
  static const String routeName="/AddPerson";

  AddPerson({Key? key}) : super(key: key);

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  TextEditingController nameController=TextEditingController();

  TextEditingController heightController=TextEditingController();

  TextEditingController weightController=TextEditingController();

  DateTime selecteedDate=DateTime.now();

  int selectedDayes= 3;

  List<int> daysList=[
    3,
    4,
    6
  ];

  String selectedType="Lose";

  List<String> typeList=[
    " Lose",
    "Over"
  ];

  String selectedPayed="payed";

  List<String> payed=[
    "payed",
    "Not Payed"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){Navigator.of(context).pop();},),
        actions: const [
          CircleAvatar(
            backgroundImage:AssetImage("assets/images/img1.jpg"),),
          SizedBox(width: 20,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("Add Preson",style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight:FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 20),
              child: Input(txt: "Name",hintTxt: "Enter your Name",controller:nameController,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Input(
                txt: "Start Date",
                hintTxt: DateFormat.yMd().format(selecteedDate),
                widget:Row(
                children: [
                IconButton(onPressed:(){} ,icon: const Icon(Icons.access_alarm_outlined,size: 40,),focusColor: Colors.black,),

                const SizedBox(width: 20,),
              ],),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Input(txt: "Hieght",hintTxt: "170",controller:heightController,),),
                  Expanded(child: Input(txt: "Weight",hintTxt: "80",controller:weightController,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Input(txt: "Age",hintTxt: "20",),),
                  Expanded(child: Input(txt: "Days",hintTxt: selectedDayes.toString(),widget: Row(
                    children: [
                      DropdownButton(
                          items: daysList.map((e) =>DropdownMenuItem(
                              value: e.toString(),
                              child: Text(e.toString(),style: Theme.of(context).textTheme.headline2,))).toList(),
                          onChanged: (String? x){
                          setState(() {
                            selectedDayes=int.parse(x!);
                          });
                          },
                          icon:const Icon(Icons.keyboard_arrow_down),
                        iconSize: 40,
                        underline: Container(),
                        elevation: 1,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      const SizedBox(width: 15,),
                      
                    ],
                  ),),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Input(txt: "Type",hintTxt:selectedType + " Weight",
                widget: Row(
                children: [
                  DropdownButton(
                    items: typeList.map((e) =>DropdownMenuItem(
                        value: e,
                        child: Text(e,style: Theme.of(context).textTheme.headline2,))).toList(),
                    onChanged: (String? x){
                      setState(() {
                        selectedType = x!;
                      });
                    },
                    icon:const Icon(Icons.keyboard_arrow_down),
                    iconSize: 40,
                    underline: Container(),
                    elevation: 1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  const SizedBox(width: 5,),
                ],
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Input(txt: "Payed",hintTxt:selectedPayed,widget: Row(
                children: [
                  DropdownButton(
                    items: payed.map((e) =>DropdownMenuItem(
                        value: e.toString(),
                        child: Text(e.toString(),style: Theme.of(context).textTheme.headline2,))).toList(),
                    onChanged: (String? x){
                      setState(() {
                        selectedPayed = x!;
                      });
                    },
                    icon:const Icon(Icons.keyboard_arrow_down),
                    iconSize: 40,
                    underline: Container(),
                    elevation: 1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  const SizedBox(width: 15,),
                ],
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top:15,bottom: 45),
              child: Row(
                children: [
                  Spacer(),
                  Button(fun: (){}
                      , wid: 209, hei: 74, cir: 10, color: const Color.fromRGBO(22, 178, 66, 1), text:"Add Person"),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
