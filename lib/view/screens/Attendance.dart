import 'package:flutter/material.dart';
import 'package:gym2/provider/AttendanceProvider.dart';
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
            Padding(
              padding: const EdgeInsets.only(bottom: 60,top: 20,right: 20),
              child: Input(txt: "Daily Attendance",hintTxt: "Enter your Number",controller: Provider.of<AttendanceProvider>(context,listen: false).controller,),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Button(fun: (){
                      Provider.of<AttendanceProvider>(context,listen: false).addAttendanceToDatabase();
                      }
                    , wid: 177, hei: 89, cir: 20, color: const Color.fromRGBO(22, 178, 66, 1), text:"Add"),
                  ),
                 const SizedBox(width: 35,),
                  Expanded(
                    child: Button(fun: (){}
                        , wid: 177, hei: 89, cir: 20, color: const Color.fromRGBO(22, 178, 66, 1), text:"Pay"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
