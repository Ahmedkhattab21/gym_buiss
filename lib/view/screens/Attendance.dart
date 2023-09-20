import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym2/provider/AttendanceProvider.dart';
import 'package:provider/provider.dart';

import '../widget/button.dart';
import '../widget/input.dart';

class Attendance extends StatelessWidget {

   const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 60.h,top: 20.h,right: 20.w),
              child: Input(txt: "رقم الشخص ",hintTxt: "ادخل رقمك",controller: Provider.of<AttendanceProvider>(context,listen: false).controller,),
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Button(fun: (){
                      Provider.of<AttendanceProvider>(context,listen: false).validate(context);
                      }
                    , wid: 177.w, hei: 89.h, cir: 20.r, color: const Color.fromRGBO(22, 178, 66, 1), text:"اضافة"),
                  ),
                  SizedBox(width: 35.w),
                  Expanded(
                    child: Button(fun: (){
                      Provider.of<AttendanceProvider>(context,listen: false).payedValidate(context);
                    }
                        , wid: 177.w, hei: 89.h, cir: 20.r, color: const Color.fromRGBO(22, 178, 66, 1), text:"دفع"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 20.w),
              child: Button(fun: (){
                Provider.of<AttendanceProvider>(context,listen: false).validateSubscription(context);
              }
                  , wid: double.infinity, hei: 89.h, cir: 20.r, color: const Color.fromRGBO(22, 178, 66, 1), text:"تجديد اشتراك"),
            ),
          ],
        ),
      ),
    );
  }
}
