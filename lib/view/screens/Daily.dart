
import 'package:flutter/material.dart';
import 'package:gym2/view/screens/Attendance.dart';
import 'package:gym2/view/screens/LoseWeight.dart';
import 'package:gym2/view/screens/OverWeight.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'NewPerson.dart';
class DailyPage extends StatefulWidget {
  static const String routeName="/Daily";
  @override
  State<DailyPage> createState() => _DailyPageState();
}
class _DailyPageState extends State<DailyPage> {


  int currIndex = 0;
  List<Widget> screens=const[
    Attendance(),
    NewPerson(),
    LoseWeight(),
    OverWeight()
  ];

  @override
  Widget build(BuildContext context) {
    List<AppBar> Appsbar=[
      AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text("Attendance",style: Theme.of(context).textTheme.headline2,),
      actions: const [
        CircleAvatar(
          backgroundImage:AssetImage("assets/images/img1.jpg"),),
        SizedBox(width: 20,),
      ],
    ),
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("New Person",style: Theme.of(context).textTheme.headline2,),
        actions: const [
          CircleAvatar(
            backgroundImage:AssetImage("assets/images/img1.jpg"),),
          SizedBox(width: 20,),
        ],
      ),
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          CircleAvatar(
            backgroundImage:AssetImage("assets/images/img1.jpg"),),
          SizedBox(width: 20,),
        ],
      ),
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          CircleAvatar(
            backgroundImage:AssetImage("assets/images/img1.jpg"),),
          SizedBox(width: 20,),
        ],
      )
    ];


    return Scaffold(
      appBar: Appsbar[currIndex],
      body:screens[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:const Color.fromRGBO(217, 217, 217, .5),
        elevation: 0,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        selectedItemColor:const Color.fromRGBO(22, 178, 66, 1),
        unselectedItemColor: Colors.black54,
        selectedIconTheme:const IconThemeData(
          color: Color.fromRGBO(22, 178, 66, 1),
          size: 38,
        ),
        unselectedIconTheme:const IconThemeData(
          color: Colors.black54,
          size: 28,
        ),
        currentIndex: currIndex,
        onTap: (int i){
          setState(() {
            currIndex=i;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined,),
            label: "Dialy",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,),
              label: "Add"

          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.glassWater),
              label: "lose",
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dumbbell),
            label: "Over"
          )
        ],
      ),
    );
  }
}