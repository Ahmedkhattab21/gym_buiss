import 'package:flutter/material.dart';

import '../widget/button.dart';
import '../widget/input.dart';

class AddPerson extends StatelessWidget {
  static const String routeName="/AddPerson";
  const AddPerson({Key? key}) : super(key: key);

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
              child: Input(txt: "Name",controller:TextEditingController(),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Input(txt: "Start Date",controller:TextEditingController(),widget:Row(
                children: [
                IconButton(onPressed:(){} ,icon: const Icon(Icons.access_alarm_outlined,size: 30,),focusColor: Colors.black,),

                const SizedBox(width: 20,),
              ],),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Input(txt: "Hieght",controller:TextEditingController(),),),
                  Expanded(child: Input(txt: "Weight",controller:TextEditingController(),),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Input(txt: "Age",controller:TextEditingController(),),),
                  Expanded(child: Input(txt: "Days",controller:TextEditingController(),widget: Row(
                    children: [
                      IconButton(onPressed: (){},icon:const Icon(Icons.keyboard_arrow_down,size: 40,),),
                      const SizedBox(width: 15,),
                    ],
                  ),),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Input(txt: "Type",controller:TextEditingController(),widget: Row(
                    children: [
                      IconButton(onPressed: (){},icon:const Icon(Icons.keyboard_arrow_down,size: 40,),),
                      const SizedBox(width: 15,),
                    ],
                  ),),),
                  Expanded(child: Input(txt: "Payed",controller:TextEditingController(),widget: Row(
                    children: [
                      IconButton(onPressed: (){},icon:const Icon(Icons.keyboard_arrow_down,size: 40,),),
                      const SizedBox(width: 15,),
                    ],
                  ),),),
                ],
              ),
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
