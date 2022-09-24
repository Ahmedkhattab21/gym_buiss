import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Function() fun;
  double wid;
  double hei;
  double cir;
  Color color;
  String text;
   Button({required this.fun,required this.wid,required this.hei,required this.cir,required this.color,required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor:Colors.white,
      onTap: fun,
      child: Container(
        margin:const EdgeInsets.only(top: 14),
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
