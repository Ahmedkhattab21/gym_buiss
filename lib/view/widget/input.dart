import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  String txt;
  String hintTxt;
  TextEditingController? controller;
  Widget? widget;
 Input({super.key, required this.txt,required this.hintTxt,this.controller,this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(txt,style: Theme.of(context).textTheme.headline2,),
          Container(
            padding: EdgeInsets.only(top: 5.h,bottom: 5.h),
              margin:  EdgeInsets.only(left: 15.w,top: 5.h,right: 5.w),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 238, 238, 1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: widget !=null ? true:false,
                      cursorColor: Colors.black45,
                      style: Theme.of(context).textTheme.headline1,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: hintTxt,
                        hintStyle: Theme.of(context).textTheme.headline2!.copyWith(color:Colors.grey ),
                        fillColor:const  Color.fromRGBO(238, 238, 238, 1),
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: const Color.fromRGBO(238, 238, 238, 1),width: 0.w),
                        ),
                          focusedBorder:UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: const Color.fromRGBO(238, 238, 238, 1),width: 0.w),
                          ),
                      ),
                    ),
                  ),
                 widget??Container(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
