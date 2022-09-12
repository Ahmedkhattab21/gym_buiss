
import 'package:flutter/material.dart';
class DailyPage extends StatefulWidget {
  static const String routeName="/Daily";
  @override
  State<DailyPage> createState() => _DailyPageState();
}
class _DailyPageState extends State<DailyPage> {
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("hello "),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:Color.fromRGBO(217, 217, 217, .5),
        elevation: 0,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        selectedItemColor: Color.fromRGBO(22, 178, 66, 1),
        unselectedItemColor: Colors.black54,
        selectedIconTheme:IconThemeData(
          color: Color.fromRGBO(22, 178, 66, 1),
          size: 38,
        ),
        unselectedIconTheme:IconThemeData(
          color: Colors.black54,
          size: 28,
        ),
        currentIndex: currIndex,
        onTap: (int i){
          setState(() {
            currIndex=i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined,),
            label: "Dialy",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,),
              label: "Add"

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined,),
              label: "lose",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
            label: "Over"
          )
        ],
      ),
    );
  }
}