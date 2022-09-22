import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym2/provider/NewPersonProvider.dart';
import 'package:provider/provider.dart';
import '../widget/button.dart';
import '../widget/input.dart';
import 'package:intl/intl.dart';

class AddPerson extends StatelessWidget {
  static const String routeName="/AddPerson";

  AddPerson({Key? key}) : super(key: key);

  @override



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
              child: Input(txt: "Name",hintTxt: "Enter your Name",controller:Provider.of<NewPersonProvider>(context,listen: false).nameController,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Input(
                txt: "Start Date",
                hintTxt: DateFormat.yMd().format(Provider.of<NewPersonProvider>(context,listen: true).selecteedDate),
                widget:Row(
                children: [
                IconButton(onPressed:(){
                  Provider.of<NewPersonProvider>(context,listen: false).getDateFromUser(context);
                } ,icon: const Icon(Icons.access_alarm_outlined,size: 40,),focusColor: Colors.black,),

                const SizedBox(width: 20,),
              ],),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Input(txt: "Hieght",hintTxt: "170",controller:Provider.of<NewPersonProvider>(context,listen: false).heightController,),),
                  Expanded(child: Input(txt: "Weight",hintTxt: "80",controller:Provider.of<NewPersonProvider>(context,listen: false).weightController,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Input(txt: "Age",hintTxt: "20",controller:Provider.of<NewPersonProvider>(context,listen: false).age ,),),
                  Expanded(child: Input(txt: "Days",hintTxt: Provider.of<NewPersonProvider>(context,listen: true).selectedDayes.toString(),widget: Row(
                    children: [
                      Consumer(builder:((BuildContext ctx,NewPersonProvider value,ch)=>
                      DropdownButton(
                        items: value.daysList.map((e) =>DropdownMenuItem(
                          value: e.toString(),
                          child: Text(e.toString(),style: Theme.of(context).textTheme.headline2,))).toList(),
                        onChanged: (String? x)=>value.ontapp(x),
                        icon:const Icon(Icons.keyboard_arrow_down),
                        iconSize: 40,
                        underline: Container(),
                        elevation: 1,
                        borderRadius: BorderRadius.circular(20),
                      )
                      ),
                      ),
                     const SizedBox(width: 15,),
                      
                    ],
                  ),),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Input(txt: "Type",hintTxt:Provider.of<NewPersonProvider>(context,listen: true).selectedType + " Weight",
                widget: Row(
                children: [
                  Consumer(builder:((BuildContext ctx,NewPersonProvider value,ch)=>
                  DropdownButton(
                    items: value.typeList.map((e) =>DropdownMenuItem(
                        value: e,
                        child: Text(e,style: Theme.of(context).textTheme.headline2,))).toList(),
                    onChanged: (String? x)=>value.ontapp2(x),
                    icon:const Icon(Icons.keyboard_arrow_down),
                    iconSize: 40,
                    underline: Container(),
                    elevation: 1,
                    borderRadius: BorderRadius.circular(20),
                  )),),
                  const SizedBox(width: 5,),
                ],
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Input(txt: "Payed",hintTxt:Provider.of<NewPersonProvider>(context,listen: true).selectedPayed,widget: Row(
                children: [
                  Consumer(builder:((BuildContext ctx,NewPersonProvider value,ch)=>
                  DropdownButton(
                    items: value.payed.map((e) =>DropdownMenuItem(
                        value: e.toString(),
                        child: Text(e.toString(),style: Theme.of(context).textTheme.headline2,))).toList(),
                    onChanged: (String? x)=>value.ontapp3(x),
                    icon:const Icon(Icons.keyboard_arrow_down),
                    iconSize: 40,
                    underline: Container(),
                    elevation: 1,
                    borderRadius: BorderRadius.circular(20),
                  )),),
                  const SizedBox(width: 15,),
                ],
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top:15,bottom: 45),
              child: Row(
                children: [
                  Spacer(),
                  Button(fun: (){
                  Provider.of<NewPersonProvider>(context,listen: false).valedaate(context);
                    }
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
