import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  Function() fun;
  final double wid;
  final double hei;
  final double cir;
  final Color color;
  final String text;
    Button({super.key, required this.fun,required this.wid,required this.hei,required this.cir,required this.color,required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor:Colors.white,
      onTap: fun,
      child: Container(
        margin: EdgeInsets.only(top: 14.h),
        alignment: Alignment.center,
        width: wid,
        height: hei,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(cir),
          color: color,
        ),
        child: Text(text,style: Theme.of(context).textTheme.button,),
      ),
    );
  }
}
