
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym2/provider/AttendanceProvider.dart';
import 'package:gym2/view/screens/Attendance.dart';
import 'package:gym2/view/screens/LoseWeight.dart';
import 'package:gym2/view/screens/OverWeight.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


import '../../provider/LoseWeightProvider.dart';
import '../../provider/OverWeightProvider.dart';
import 'NewPerson.dart';
class DailyPage extends StatefulWidget {
  static const String routeName="/Daily";

  const DailyPage({super.key});
  @override
  State<DailyPage> createState() => _DailyPageState();
}
class _DailyPageState extends State<DailyPage> {

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: Provider.of<AttendanceProvider>(context,listen: true).getAppBars(context)[Provider.of<AttendanceProvider>(context,listen: true).currIndex],
        body:Provider.of<AttendanceProvider>(context,listen: true).getScreens(context)[Provider.of<AttendanceProvider>(context,listen: true).currIndex],
        bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:const Color.fromRGBO(217, 217, 217, .5),
          elevation: 0,
          selectedFontSize: 20.sp,
          unselectedFontSize: 15.sp,
          selectedItemColor:const Color.fromRGBO(22, 178, 66, 1),
          unselectedItemColor: Colors.black54,
          selectedIconTheme: IconThemeData(
            color:const Color.fromRGBO(22, 178, 66, 1),
            size: 38.r,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black54,
            size: 28.r,
          ),
          currentIndex: Provider.of<AttendanceProvider>(context,listen: true).currIndex,
          onTap: (int i){
              Provider.of<AttendanceProvider>(context,listen: false).changeCurrentIndex(i);
              if(i==2){
                Provider.of<LosingProvider>(context,listen: false).getDataOfLoseWeight();
              }
              if(i==3){
                Provider.of<OveringProvider>(context,listen: false).getDataOfOverWeight();
              }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined,),
              label: "الحضور",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add,),
                label: "اضافة"
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.glassWater),
              label: "تخسيس",
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.dumbbell),
                label: "حديد"
            ),

          ],
        ),
      ),
    );
  }
}
