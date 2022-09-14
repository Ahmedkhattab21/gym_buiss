import 'package:flutter/material.dart';
import 'package:gym2/controller/provider/AttendanceProvider.dart';
import 'package:provider/provider.dart';

import '../widget/button.dart';
import '../widget/input.dart';

class Attendance extends StatelessWidget {

   Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Input(txt: "Daily Attendance",controller: Provider.of<AttendanceProvider>(context,listen: false).controller,widget: const SizedBox(width: 30,),),
            Button(fun: (){
              Provider.of<AttendanceProvider>(context,listen: false).addAttendanceToDatabase();}
            , wid: 350, hei: 100, cir: 20, color: const Color.fromRGBO(22, 178, 66, 1), text:"Add"),
          ],
        ),
      ),
    );
  }
}
